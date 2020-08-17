IMAGES := $(shell docker images -f "dangling=true" -q)
CONTAINERS := $(shell docker ps -a -q -f status=exited)

.PHONY: clean build start

clean:
	docker rm -f $(CONTAINERS)
	docker rmi -f $(IMAGES)


start:
	docker run -d --name elasticsearch6 \
	--network oscari-net \
	--network-alias elasticsearch \
	--volume esdata6:/usr/share/elasticsearch/data \
	-e xpack.security.enabled=false \
	-e discovery.type=single-node \
	--memory=4g \
	--memory-swap=4g \
	--ulimit memlock=-1:-1 \
	docker.elastic.co/elasticsearch/elasticsearch:6.8.1

