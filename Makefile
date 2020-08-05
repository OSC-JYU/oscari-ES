IMAGES := $(shell docker images -f "dangling=true" -q)
CONTAINERS := $(shell docker ps -a -q -f status=exited)


clean:
	docker rm -f $(CONTAINERS)
	docker rmi -f $(IMAGES)

build: 
	docker build -t artturimatias/elasticsearch:5.6.16 build/elasticsearch

start:
	docker run -d --name elasticsearch1 \
	--network oscari-net \
	--network-alias elasticsearch \
	--volume esdata1:/usr/share/elasticsearch/data \
	-p 9200:9200 \
	-p 9300:9300 \
	--memory=4g \
	--memory-swap=4g \
	--ulimit memlock=-1:-1 \
	artturimatias/elasticsearch:5.6.16

