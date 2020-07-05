FROM centos:8

RUN  dnf -y update && dnf install -y wget \
  && wget https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm \
  && yum localinstall -y mysql80-community-release-el8-1.noarch.rpm \
  && dnf --enablerepo=mysql-connectors-community -y install mysql-connector-java


