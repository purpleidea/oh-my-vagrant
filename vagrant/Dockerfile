# DOCKER HACKING
#
# VERSION 0.1
#
# build with: sudo docker built -t test .

FROM fedora

MAINTAINER James Shubin <james@shubin.ca>

#RUN yum update -y
RUN echo Hello from James > README

#ENTRYPOINT wc -l
# start this server
ENTRYPOINT python -m SimpleHTTPServer

# run ENTRYPOINT as this user...
#USER XXX

# let port 8000 be visible from outside
EXPOSE 8000

