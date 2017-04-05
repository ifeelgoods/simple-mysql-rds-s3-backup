FROM ubuntu:16.04
MAINTAINER Matthieu Paret <matthieu@ifeelgoods.com>

RUN apt-get update && apt-get upgrade -y && apt-get install mysql-client python-pip -y
RUN pip install --upgrade awscli

RUN mkdir -p /backup
COPY backup.sh backup/
WORKDIR /backup/

CMD ["/backup/backup.sh"]