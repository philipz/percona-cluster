FROM ubuntu:trusty
MAINTAINER Philipz <philipzheng@gmail.com>
# Upgrade
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://repo.percona.com/apt trusty main" >> /etc/apt/sources.list.d/percona.list
RUN echo "deb-src http://repo.percona.com/apt trusty main" >> /etc/apt/sources.list.d/percona.list
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
RUN apt-get update
RUN apt-get install -y percona-xtradb-cluster-56 qpress xtrabackup inotify-tools netcat
EXPOSE 3306 4444 4567 4568
