ARG ELK_VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/logstash/logstash:${ELK_VERSION}


# ERROR: Installation aborted, plugin 'logstash-input-jdbc' is already provided by 'logstash-integration-jdbc'
# ERROR: Service 'logstash' failed to build: The command '/bin/sh -c bin/logstash-plugin install logstash-input-jdbc' returned a non-zero code: 1
# albe@pmdsdata7:/srv/file/test/elastic/deviantony/docker-elk$
#
#   RUN bin/logstash-plugin install logstash-input-jdbc


# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
