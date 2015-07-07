#!/usr/bin/python

# README:
# for initial setup, browse to: https://copr.fedoraproject.org/api/
# and it will have a ~/.config/copr config that you can download.
# happy hacking!

import os
import sys
import copr

COPR = 'oh-my-vagrant'
if len(sys.argv) != 2:
	print("Usage: %s <srpm url>" % sys.argv[0])
	sys.exit(1)

url = sys.argv[1]

client = copr.CoprClient.create_from_file_config(os.path.expanduser("~/.config/copr"))

result = client.create_new_build(COPR, [url])
if result.output != "ok":
	print(result.error)
	sys.exit(1)
print(result.message)
