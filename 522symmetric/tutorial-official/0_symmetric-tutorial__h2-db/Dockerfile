FROM centos:7

RUN yum clean all  && yum install -y epel-release \
 && yum install -y  java-1.8.0-openjdk nmap-ncat openssl unzip jq wget mc 

WORKDIR /app

ENV SYMMETRICDS_VERSION 3.12.1

RUN MINOR=`echo "${SYMMETRICDS_VERSION}" | sed 's/\.[^.]*$//'` \
 && curl -L -o 'symmetricds.zip' "https://downloads.sourceforge.net/project/symmetricds/symmetricds/symmetricds-${MINOR}/symmetric-server-${SYMMETRICDS_VERSION}.zip" \
 && unzip 'symmetricds.zip' \
 && rm 'symmetricds.zip' \
 && mv "symmetric-server-${SYMMETRICDS_VERSION}/" 'syms'

RUN  yum clean all \
 && rpm --rebuilddb 
