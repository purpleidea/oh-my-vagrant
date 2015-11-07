#!/usr/bin/python

# modified from:
# https://github.com/kbsingh/centos-ci-scripts/blob/master/build_python_script.py
# usage: centos-ci.py giturl [branch [commands]]

import os
import sys
import json
import urllib
import subprocess

url_base = 'http://admin.ci.centos.org:8080'
apikey = open('duffy.key', 'r').read().strip()
ver = '7'
arch = 'x86_64'
count = 1

git_url = sys.argv[1]
branch = 'master'
if len(sys.argv) > 2: branch = sys.argv[2]
folder = os.path.splitext(os.path.basename(__file__))[0]
run = 'make test' # the omv vtest command is a good option too
if len(sys.argv) > 3: run = ' '.join(sys.argv[3:])

get_nodes_url = "%s/Node/get?key=%s&ver=%s&arch=%s&i_count=%s" % (url_base, apikey, ver, arch, count)
data = json.loads(urllib.urlopen(get_nodes_url).read()) # request host(s)
hosts = data['hosts']
ssid = data['ssid']
done_nodes_url = "%s/Node/done?key=%s&ssid=%s" % (url_base, apikey, ssid)

host = hosts[0]
ssh = "ssh -t -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@%s" % host
yum = 'yum -y install git wget'
omv = 'wget https://github.com/purpleidea/oh-my-vagrant/raw/master/extras/install-omv.sh && chmod u+x install-omv.sh && ./install-omv.sh'
cmd = "%s '%s && %s'" % (ssh, yum, omv) # setup
print cmd
r = subprocess.call(cmd, shell=True)
if r != 0:
	# NOTE: we don't clean up the host here, so that it can be inspected!
	print "Error configuring omv on: %s" % host
	sys.exit(r)

# the second ssh call will run with the omv /etc/profile.d/ script loaded
git = "git clone --recursive %s %s && cd %s && git checkout %s" % (git_url, folder, folder, branch)
cmd = "%s '%s && %s'" % (ssh, git, run) # run
print cmd
r = subprocess.call(cmd, shell=True)
if r != 0:
	print "Error running job on: %s" % host

output = urllib.urlopen(done_nodes_url).read() # free host(s)
if output != 'Done':
	print "Error freeing host: %s" % host

sys.exit(r)
