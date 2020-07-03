FROM centos:7

RUN yum clean all  && yum install -y epel-release \
 && yum install -y  java-1.8.0-openjdk nmap-ncat openssl unzip jq wget mc 

WORKDIR /app

# Get Symmetricds server.. 
ENV SYMMETRICDS_VERSION 3.12.1
#
RUN MINOR=`echo "${SYMMETRICDS_VERSION}" | sed 's/\.[^.]*$//'` \
 && curl -L -o 'symmetricds.zip' "https://downloads.sourceforge.net/project/symmetricds/symmetricds/symmetricds-${MINOR}/symmetric-server-${SYMMETRICDS_VERSION}.zip" \
 && unzip 'symmetricds.zip' \
 && rm 'symmetricds.zip' \
 && mv "symmetric-server-${SYMMETRICDS_VERSION}/" 'syms'

RUN  yum clean all 
# error in centos 8 -- error: failed to replace old database with new database! --  && rpm --rebuilddb 

# Update mysql driver to ver 8.x 
#
# error..
# Loading class `com.mysql.jdbc.Driver'. This is deprecated. The new driver class is `com.mysql.cj.jdbc.Driver'. The driver is automatically registered via the SPI and manual loading of the driver class is generally unnecessary.
# sym_1      | [store01] - SymmetricEngineHolder - java.lang.IllegalStateException: Missing JDBC driver for 'com.mysql.jdbc.Driver '. 
#
# RUN mv /app/syms/lib/mysql-connector-java-5.1.45.jar mysql-connector-java-5.1.45.jar-offline \
#  && wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.20.tar.gz \
#  && tar -xf mysql-connector-java-8.0.20.tar.gz \
#  && mv ./mysql-connector-java-8.0.20/mysql-connector-java-8.0.20.jar /app/syms/lib/ \
#  && rm -rf ./mysql-connector-java-8.0.20 \
#  && rm mysql-connector-java-8.0.20.tar.gz


# Update mysql driver to newer ver 5.x 
# RUN mv /app/syms/lib/mysql-connector-java-5.1.45.jar mysql-connector-java-5.1.45.jar-offline \
#  && wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.49.tar.gz \
#  && tar -xf mysql-connector-java-5.1.49.tar.gz \
#  && mv ./mysql-connector-java-5.1.49/mysql-connector-java-5.1.49.jar /app/syms/lib/ \
#  && rm -rf ./mysql-connector-java-5.1.49 \
#  && rm mysql-connector-java-5.1.49.tar.gz

