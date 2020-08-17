FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.9
COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config
