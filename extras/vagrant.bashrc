### VAGRANT ###################################################################
# avoid needing to always add --provider=libvirt
export VAGRANT_DEFAULT_PROVIDER=libvirt
#alias vagrant='/opt/vagrant/bin/vagrant'

# if oh-my-vagrant has the mainstream entrypoint installed, then use it instead
OMV=`which omv 2> /dev/null`
if [ "$OMV" != '' ] && [ "$VAGRANT" = '' ]; then
	VAGRANT='omv'
else
	VAGRANT='vagrant'
fi

alias vs="$VAGRANT status"
alias vp="$VAGRANT provision"
alias vup="$VAGRANT up"
alias vrsync="$VAGRANT rsync"
alias vdestroy="$VAGRANT destroy"
alias vrm-rf="$VAGRANT --omv-reallyrmonce=true status"
function vlog {
	VAGRANT_LOG=info $VAGRANT "$@" 2> vagrant.log
}

# vagrant ssh (better than vagrant ssh)
function vssh {
	[ "$1" = '' ] || [ "$2" != '' -a "$2" != '-c' ] || [ "$2" = '-c' -a "$3" = '' ] && echo "Usage: vssh <vm-name> [-c COMMAND] - vagrant screen" 1>&2 && return 1
	vfile='Vagrantfile'
	if [[ "$VAGRANT" == omv* ]]; then
		vfile='omv.yaml'
	fi
	wd=`pwd`		# save wd, then find the Vagrant project
	while [ "`pwd`" != '/' ] && [ ! -e "`pwd`/$vfile" ] && [ ! -d "`pwd`/.vagrant/" ]; do
		#echo "pwd is `pwd`"
		cd ..
	done
	pwd=`pwd`
	cd $wd
	if [ ! -e "$pwd/$vfile" ] || [ ! -d "$pwd/.vagrant/" ]; then
		echo 'Vagrant project not found!' 1>&2 && return 2
	fi

	# if we find the omv.yaml file, it takes precendence for mtime lookups
	if [ -e "$pwd/omv.yaml" ]; then
		pfile="$pwd/omv.yaml"
	elif [ -e "$pwd/Vagrantfile" ]; then
		pfile="$pwd/Vagrantfile"
	else
		echo 'No vagrant definition found!' 1>&2 && return 2
	fi

	host="$1"	# save variables
	cmd=''
	if [ "$2" = '-c' -a "$3" != '' ]; then
		shift 2
		cmd="$@"	# join $3...last
	fi

	d="$pwd/.ssh"
	f="$d/$host.config"
	h="$host"
	# hostname extraction from user@host pattern
	p=`expr index "$host" '@'`
	if [ $p -gt 0 ]; then
		let "l = ${#h} - $p"
		h=${h:$p:$l}
	fi

	cdfile="$pwd/.vagrant/$h.cd"

	# if cd file is missing, or is older than the definition file, re-generate...
	# or if mtime of $f is > than 5 minutes (5 * 60 seconds), re-generate...
	if [ ! -e "$cdfile" ] || \
	[ $(stat -c '%Y' "$pfile" 2> /dev/null) -gt $(stat -c '%Y' "$cdfile" 2> /dev/null) ] || \
	[ `date -d "now - $(stat -c '%Y' "$f" 2> /dev/null) seconds" +%s` -gt 300 ]; then
		mkdir -p "$d"
		# we cache the lookup because this command is slow...
		$VAGRANT ssh-config "$h" > "$f" || rm "$f"
	fi

	cddir="`cat $cdfile 2>/dev/null`"
	if [ -e "$cdfile" ] && [ -n "$cddir" ]; then
		# switch into the cd dir, and then run that users shell
		_cmd="cd '$cddir' && exec $(getent passwd `whoami` | awk -F ':' '{print $7}')"
		if [ "$cmd" != '' ]; then
			_cmd="$_cmd -c '$cmd'"	# add on the -c to bash
		fi
		cmd="$_cmd"
		unset _cmd
	fi

	[ -e "$f" ] && ssh -t -F "$f" "$host" "$cmd"
	e=$?
	if [ $e -eq 255 ]; then
		# you probably want a shorter timeout if you see this often
		echo 'Maybe cached connection was stale? Cleaning...'
		rm -f "$f"	# clean stale ssh connection
		# TODO: recurse up to one time?
	else
		return $e
	fi
}

# vagrant sftp
function vsftp {
	[ "$1" = '' ] || [ "$2" != '' ] && echo "Usage: vsftp <vm-name> - vagrant sftp" 1>&2 && return 1
	vfile='Vagrantfile'
	if [[ "$VAGRANT" == omv* ]]; then
		vfile='omv.yaml'
	fi
	wd=`pwd`		# save wd, then find the Vagrant project
	while [ "`pwd`" != '/' ] && [ ! -e "`pwd`/$vfile" ] && [ ! -d "`pwd`/.vagrant/" ]; do
		#echo "pwd is `pwd`"
		cd ..
	done
	pwd=`pwd`
	cd $wd
	if [ ! -e "$pwd/$vfile" ] || [ ! -d "$pwd/.vagrant/" ]; then
		echo 'Vagrant project not found!' 1>&2 && return 2
	fi

	# if we find the omv.yaml file, it takes precendence for mtime lookups
	if [ -e "$pwd/omv.yaml" ]; then
		pfile="$pwd/omv.yaml"
	elif [ -e "$pwd/Vagrantfile" ]; then
		pfile="$pwd/Vagrantfile"
	else
		echo 'No vagrant definition found!' 1>&2 && return 2
	fi

	d="$pwd/.ssh"
	f="$d/$1.config"
	h="$1"
	# hostname extraction from user@host pattern
	p=`expr index "$1" '@'`
	if [ $p -gt 0 ]; then
		let "l = ${#h} - $p"
		h=${h:$p:$l}
	fi

	cdfile="$pwd/.vagrant/$h.cd"

	# if cd file is missing, or is older than the definition file, re-generate...
	# or if mtime of $f is > than 5 minutes (5 * 60 seconds), re-generate...
	if [ ! -e "$cdfile" ] || \
	[ $(stat -c '%Y' "$pfile" 2> /dev/null) -gt $(stat -c '%Y' "$cdfile" 2> /dev/null) ] || \
	[ `date -d "now - $(stat -c '%Y' "$f" 2> /dev/null) seconds" +%s` -gt 300 ]; then
		mkdir -p "$d"
		# we cache the lookup because this command is slow...
		$VAGRANT ssh-config "$h" > "$f" || rm "$f"
	fi

	cdstr=''	# path to append to end of sftp
	cddir="`cat $cdfile 2>/dev/null`"
	if [ -e "$cdfile" ] && [ -n "$cddir" ]; then
		cdstr=":$cddir"
	fi

	[ -e "$f" ] && sftp -F "$f" "$1""$cdstr"
}

# vagrant screen
function vscreen {
	[ "$1" = '' ] || [ "$2" != '' ] && echo "Usage: vscreen <vm-name> - vagrant screen" 1>&2 && return 1
	vfile='Vagrantfile'
	if [[ "$VAGRANT" == omv* ]]; then
		vfile='omv.yaml'
	fi
	wd=`pwd`		# save wd, then find the Vagrant project
	while [ "`pwd`" != '/' ] && [ ! -e "`pwd`/$vfile" ] && [ ! -d "`pwd`/.vagrant/" ]; do
		#echo "pwd is `pwd`"
		cd ..
	done
	pwd=`pwd`
	cd $wd
	if [ ! -e "$pwd/$vfile" ] || [ ! -d "$pwd/.vagrant/" ]; then
		echo 'Vagrant project not found!' 1>&2 && return 2
	fi

	# if we find the omv.yaml file, it takes precendence for mtime lookups
	if [ -e "$pwd/omv.yaml" ]; then
		pfile="$pwd/omv.yaml"
	elif [ -e "$pwd/Vagrantfile" ]; then
		pfile="$pwd/Vagrantfile"
	else
		echo 'No vagrant definition found!' 1>&2 && return 2
	fi

	cmd='screen -xRR'

	d="$pwd/.ssh"
	f="$d/$1.config"
	h="$1"
	# hostname extraction from user@host pattern
	p=`expr index "$1" '@'`
	if [ $p -gt 0 ]; then
		let "l = ${#h} - $p"
		h=${h:$p:$l}
	fi

	cdfile="$pwd/.vagrant/$h.cd"

	# if cd file is missing, or is older than the definition file, re-generate...
	# or if mtime of $f is > than 5 minutes (5 * 60 seconds), re-generate...
	if [ ! -e "$cdfile" ] || \
	[ $(stat -c '%Y' "$pfile" 2> /dev/null) -gt $(stat -c '%Y' "$cdfile" 2> /dev/null) ] || \
	[ `date -d "now - $(stat -c '%Y' "$f" 2> /dev/null) seconds" +%s` -gt 300 ]; then
		mkdir -p "$d"
		# we cache the lookup because this command is slow...
		$VAGRANT ssh-config "$h" > "$f" || rm "$f"
	fi

	cddir="`cat $cdfile 2>/dev/null`"
	if [ -e "$cdfile" ] && [ -n "$cddir" ]; then
		cmd="cd '$cddir' && $cmd"
	fi

	[ -e "$f" ] && ssh -t -F "$f" "$1" $cmd
	if [ $? -eq 255 ]; then
		# you probably want a shorter timeout if you see this often
		echo 'Maybe cached connection was stale? Cleaning...'
		rm -f "$f"	# clean stale ssh connection
		# TODO: recurse up to one time?
	fi
}

# vagrant cssh
function vcssh {
	[ "$1" = '' ] && echo "Usage: vcssh [options] [user@]<vm1>[ [user@]vm2[ [user@]vmN...]] - vagrant cssh" 1>&2 && return 1
	vfile='Vagrantfile'
	if [[ "$VAGRANT" == omv* ]]; then
		vfile='omv.yaml'
	fi
	wd=`pwd`		# save wd, then find the Vagrant project
	while [ "`pwd`" != '/' ] && [ ! -e "`pwd`/$vfile" ] && [ ! -d "`pwd`/.vagrant/" ]; do
		#echo "pwd is `pwd`"
		cd ..
	done
	pwd=`pwd`
	cd $wd
	if [ ! -e "$pwd/$vfile" ] || [ ! -d "$pwd/.vagrant/" ]; then
		echo 'Vagrant project not found!' 1>&2 && return 2
	fi

	d="$pwd/.ssh"
	cssh="$d/cssh"
	cmd=''
	cat='cat '
	screen=''
	options=''

	multi='f'
	special=''
	for i in "$@"; do	# loop through the list of hosts and arguments!
		#echo $i

		if [ "$special" = 'debug' ]; then	# optional arg value...
			special=''
			if [ "$1" -ge 0 -o "$1" -le 4 ]; then
				cmd="$cmd $i"
				continue
			fi
		fi

		if [ "$multi" = 'y' ]; then	# get the value of the argument
			multi='n'
			cmd="$cmd '$i'"
			continue
		fi

		if [ "${i:0:1}" = '-' ]; then	# does argument start with: - ?

			# build a --screen option
			if [ "$i" = '--screen' ]; then
				screen=' -o RequestTTY=yes'
				cmd="$cmd --action 'screen -xRR'"
				continue
			fi

			if [ "$i" = '--debug' ]; then
				special='debug'
				cmd="$cmd $i"
				continue
			fi

			if [ "$i" = '--options' ]; then
				options=" $i"
				continue
			fi

			# NOTE: commented-out options are probably not useful...
			# match for key => value argument pairs
			if [ "$i" = '--action' -o "$i" = '-a' ] || \
			[ "$i" = '--autoclose' -o "$i" = '-A' ] || \
			#[ "$i" = '--cluster-file' -o "$i" = '-c' ] || \
			#[ "$i" = '--config-file' -o "$i" = '-C' ] || \
			#[ "$i" = '--evaluate' -o "$i" = '-e' ] || \
			[ "$i" = '--font' -o "$i" = '-f' ] || \
			#[ "$i" = '--master' -o "$i" = '-M' ] || \
			#[ "$i" = '--port' -o "$i" = '-p' ] || \
			#[ "$i" = '--tag-file' -o "$i" = '-c' ] || \
			[ "$i" = '--term-args' -o "$i" = '-t' ] || \
			[ "$i" = '--title' -o "$i" = '-T' ] || \
			[ "$i" = '--username' -o "$i" = '-l' ] ; then
				multi='y'	# loop around to get second part
				cmd="$cmd $i"
				continue
			else			# match single argument flags...
				cmd="$cmd $i"
				continue
			fi
		fi

		f="$d/$i.config"
		h="$i"
		# hostname extraction from user@host pattern
		p=`expr index "$i" '@'`
		if [ $p -gt 0 ]; then
			let "l = ${#h} - $p"
			h=${h:$p:$l}
		fi

		# if mtime of $f is > than 5 minutes (5 * 60 seconds), re-generate...
		if [ `date -d "now - $(stat -c '%Y' "$f" 2> /dev/null) seconds" +%s` -gt 300 ]; then
			mkdir -p "$d"
			# we cache the lookup because this command is slow...
			$VAGRANT ssh-config "$h" > "$f" || rm "$f"
		fi

		if [ -e "$f" ]; then
			cmd="$cmd $i"
			cat="$cat $f"	# append config file to list
		fi
	done

	cat="$cat > $cssh"
	#echo $cat
	eval "$cat"			# generate combined config file

	#echo $cmd && return 1
	#[ -e "$cssh" ] && cssh --options "-F ${cssh}$options" $cmd
	# running: bash -c glues together --action 'foo --bar' type commands...
	[ -e "$cssh" ] && bash -c "cssh --options '-F ${cssh}${screen}$options' $cmd"
}

# vagrant forward (ssh -L)
function vfwd {
	[ "$1" = '' ] || [ "$2" = '' ] && echo "Usage: vfwd <vm-name> hostport:guestport [hostport:guestport] - vagrant ssh forward" 1>&2 && return 1
	vfile='Vagrantfile'
	if [[ "$VAGRANT" == omv* ]]; then
		vfile='omv.yaml'
	fi
	wd=`pwd`		# save wd, then find the Vagrant project
	while [ "`pwd`" != '/' ] && [ ! -e "`pwd`/$vfile" ] && [ ! -d "`pwd`/.vagrant/" ]; do
		#echo "pwd is `pwd`"
		cd ..
	done
	pwd=`pwd`
	cd $wd
	if [ ! -e "$pwd/$vfile" ] || [ ! -d "$pwd/.vagrant/" ]; then
		echo 'Vagrant project not found!' 1>&2 && return 2
	fi

	d="$pwd/.ssh"
	f="$d/$1.config"
	h="$1"
	# hostname extraction from user@host pattern
	p=`expr index "$1" '@'`
	if [ $p -gt 0 ]; then
		let "l = ${#h} - $p"
		h=${h:$p:$l}
	fi

	# if mtime of $f is > than 5 minutes (5 * 60 seconds), re-generate...
	if [ `date -d "now - $(stat -c '%Y' "$f" 2> /dev/null) seconds" +%s` -gt 300 ]; then
		mkdir -p "$d"
		# we cache the lookup because this command is slow...
		$VAGRANT ssh-config "$h" > "$f" || rm "$f"
	fi

	name="$1"
	shift	# pop off the vmname
	fwd=()	# array
	cmd='ssh'
	for x in "${@}"
	do
		#echo "pair: $x"
		port=`echo "$x" | awk -F ':' '{print $1}'`
		if [ "$port" -le 1024 ]; then
			cmd='sudo ssh'	# sudo needed for < 1024
		fi
		b=`echo "$x" | awk -F ':' '{print "-L "$1":localhost:"$2}'`
		fwd+=("$b")	# append
	done
	echo ${fwd[@]}	# show the -L commands
	[ -e "$f" ] && $cmd -N -F "$f" root@"$name" "${fwd[@]}"
}

# vagrant ansible
function vansible {
	[ "$1" = '' ] && echo "Usage: vansible [ansible args] - vagrant ansible" 1>&2 && return 1
	vfile='Vagrantfile'
	if [[ "$VAGRANT" == omv* ]]; then
		vfile='omv.yaml'
	fi
	wd=`pwd`		# save wd, then find the Vagrant project
	while [ "`pwd`" != '/' ] && [ ! -e "`pwd`/$vfile" ] && [ ! -d "`pwd`/.vagrant/" ]; do
		#echo "pwd is `pwd`"
		cd ..
	done
	pwd=`pwd`
	cd $wd
	if [ ! -e "$pwd/$vfile" ] || [ ! -d "$pwd/.vagrant/" ]; then
		echo 'Vagrant project not found!' 1>&2 && return 2
	fi

	k="`echo ~/.vagrant.d/insecure_private_key`"
	if [ ! -e "$k" ]; then
		echo 'Vagrant private key not found!' 1>&2 && return 3
	fi

	i="$pwd/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory"
	if [ ! -e "$i" ]; then
		echo 'Vagrant generated inventory not found!' 1>&2 && return 4
	fi

	ansible --private-key="$k" --inventory="$i" "$@"
}

# vagrant test (run tests from the `tests` omv.yaml variable)
function vtest {
	[ "$1" != '' ] && echo "Usage: vtest - vagrant test" 1>&2 && return 1
	vfile='Vagrantfile'
	if [[ "$VAGRANT" == omv* ]]; then
		vfile='omv.yaml'
	fi
	wd=`pwd`		# save wd, then find the Vagrant project
	while [ "`pwd`" != '/' ] && [ ! -e "`pwd`/$vfile" ] && [ ! -d "`pwd`/.vagrant/" ]; do
		#echo "pwd is `pwd`"
		cd ..
	done
	pwd=`pwd`
	cd $wd
	if [ ! -e "$pwd/$vfile" ] || [ ! -d "$pwd/.vagrant/" ]; then
		echo 'Vagrant project not found!' 1>&2 && return 2
	fi

	# if we find the omv.yaml file, it takes precendence for mtime lookups
	if [ -e "$pwd/omv.yaml" ]; then
		pfile="$pwd/omv.yaml"
	elif [ -e "$pwd/Vagrantfile" ]; then
		pfile="$pwd/Vagrantfile"
	else
		echo 'No vagrant definition found!' 1>&2 && return 2
	fi

	$VAGRANT status &>/dev/null	# cause the tests file to be generated
	if [ ! -e "$pwd/.vagrant/tests.sh" ]; then
		echo 'No vagrant tests.sh file found!' 1>&2 && return 3
	fi

	"$pwd/.vagrant/tests.sh"	# run the tests
	r=$?
	$VAGRANT destroy	# clean up!
	return $r
}
