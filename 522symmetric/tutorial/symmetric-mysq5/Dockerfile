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
 

# not using this.. 
# COPY ./mysql-connector-java-8.0.20.jar /app/syms/lib/
# RUN mv /app/syms/lib/mysql-connector-java-5.1.45.jar mysql-connector-java-5.1.45.jar-offline


# Update mysql driver to ver 8.x 
#
RUN mv /app/syms/lib/mysql-connector-java-5.1.45.jar mysql-connector-java-5.1.45.jar-offline \
 && wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.20.tar.gz \
 && tar -xf mysql-connector-java-8.0.20.tar.gz \
 && mv ./mysql-connector-java-8.0.20/mysql-connector-java-8.0.20.jar /app/syms/lib/ \
 && rm -rf ./mysql-connector-java-8.0.20 \
 && rm mysql-connector-java-8.0.20.tar.gz
