# Args: I think there were problems with trailing spaces at end of line. 2020-08-18_Tue_14.08-PM

# dockerfile..  https://github.com/elastic/dockerfiles/tree/v7.8.1/logstash


ARG ELK_VERSION

#FROM docker.elastic.co/logstash/logstash:6.4.0

FROM logstash:"${ELK_VERSION}"

# having some difficulty passing env var to dockerfile. Trying things..
RUN echo "$ELK_VERSION"
RUN echo "${ELK_VERSION}"
RUN echo "${MYSQL_CONNECT_VER}"
RUN echo $MYSQL_CONNECT_VER

USER 0

RUN cat /etc/lsb-release || cat /etc/centos-release

USER 1000

#安装input插件
# RUN /usr/share/logstash/bin/logstash-plugin install logstash-input-jdbc


#安装filter插件
#RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-aggregate
#RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-jdbc_streaming
#RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-mutate


#安装output插件
RUN logstash-plugin install logstash-output-elasticsearch


ARG ELK_VERSION
RUN echo "${ELK_VERSION}"
RUN echo $ELK_VERSION 

ARG MYSQL_CONNECT_VER
RUN echo "${MYSQL_CONNECT_VER}"
RUN echo $MYSQL_CONNECT_VER, $PWD
Run pwd

# add mysql driver 
COPY ./mysql-connector-java-"${MYSQL_CONNECT_VER}"/mysql-connector-java-"${MYSQL_CONNECT_VER}".jar /usr/share/logstash/mysql-connector-java.jar

