#!/bin/bash -e

# test suite for oh-my-vagrant patches...

	# ensure there is no trailing whitespace or other whitespace errors
	git diff-tree --check $(git hash-object -t tree /dev/null) HEAD
