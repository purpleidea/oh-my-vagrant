#!/bin/bash
# take current HEAD with new version
v=`git describe --match '[0-9]*\.[0-9]*\.[0-9]*' --tags --abbrev=0`
t=`echo "${v%.*}.$((${v##*.}+1))"`	# increment version
git tag $t
git push origin $t

