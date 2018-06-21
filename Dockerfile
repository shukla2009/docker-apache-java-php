FROM shukla2009/php
MAINTAINER Rahul Shukla <rahul@wootag.com>
ENV DEBIAN_FRONTEND noninteractive

RUN \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
  && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
  && apt-get update \

  # auto accept oracle jdk license
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && apt-get install -y oracle-java8-installer ca-certificates oracle-java8-set-default \

  # reduce final image size by removing the downloaded Java installer
  && rm -rf /var/cache/oracle-jdk8-installer

