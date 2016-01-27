#!/bin/bash

# download a job configuration file
# TODO: convert this to something jenkins-jobs can upload

JENKINS_BASE='https://ci.centos.org'
JENKINS_USERNAME='purpleidea'				# TODO: set this
JENKINS_PASSWORD='hunter2'				# TODO: set this
JENKINS_JOB='purpleidea-oh-my-vagrant'			# TODO: set this

# login first
wget -q -O - --save-cookies cookies.txt --post-data "j_username=${JENKINS_USERNAME}&j_password=${JENKINS_PASSWORD}&remember_me=on&Submit=log+in" "${JENKINS_BASE}/j_acegi_security_check" 1> /dev/null
# download the job
# eg: https://ci.centos.org/job/purpleidea-oh-my-vagrant/config.xml
wget -q -O - --load-cookies cookies.txt "${JENKINS_BASE}/job/${JENKINS_JOB}/config.xml" > config.xml
# clean up the crumbs
rm -rf cookies.txt
