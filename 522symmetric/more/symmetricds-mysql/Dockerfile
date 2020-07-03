FROM quay.io/ukhomeofficedigital/centos-base:latest

RUN yum update -y  \
 && yum install -y  epel-release \
 && yum install -y  java-1.8.0-openjdk nmap-ncat openssl unzip jq \
 && yum update -y  \
 && yum clean all \
 && rpm --rebuilddb \
 && useradd -rUm symds -u 10007 -d /app/ \
 && chown -R symds:symds /app/


USER 10007
WORKDIR /app

ENV SYMMETRICDS_VERSION 3.12.0

RUN MINOR=`echo "${SYMMETRICDS_VERSION}" | sed 's/\.[^.]*$//'` \
 && curl -L -o 'symmetricds.zip' "https://downloads.sourceforge.net/project/symmetricds/symmetricds/symmetricds-${MINOR}/symmetric-server-${SYMMETRICDS_VERSION}.zip" \
 && unzip 'symmetricds.zip' \
 && rm 'symmetricds.zip' \
 && ln -s "symmetric-server-${SYMMETRICDS_VERSION}/" 'symmetric-server'

COPY entrypoint.sh env.cfg liveness.sh readiness.sh /app/

USER root
RUN yum update -y -q \
 && yum clean all \
 && rpm --rebuilddb

# RUN yum --enablerepo=mysql-connectors-community install mysql-connector-java 
 # && yum install -y  mysql-connector-java 

USER 10007
CMD ["./entrypoint.sh"]

