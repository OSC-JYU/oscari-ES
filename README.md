# OSCARI-es



ElasticSearch 5.6.16 for Oscari museum system (or any dockerised CollectiveAccess installation). 
Finnish CollectiveAccess container setup for Oscari can be found here: [https://github.com/artturimatias/CollectiveAccess](https://github.com/artturimatias/CollectiveAccess)

based on:
[https://github.com/elastic/elasticsearch-docker](https://github.com/elastic/elasticsearch-docker)

## Info

This creates an ElasticSearch container that:

- has security disabled (xpack.security.enabled: false)
- uses Docker network called "oscari-net"
- can be found for other containers in THAT network by hostname "http://elasticsearch"
- uses volume called "esdata1"


## Usage

Although this is meant for Oscari museum system, it can be used for any CollectiveAccess that runs in Docker container.
Just make sure that they are on *same* network and your search.conf has these lines:

	# Set to 2 version version 2.x, 5 for version 5.x
	elasticsearch_version = 5

	# Enter the elastic search base url here (without any index names)
	search_elasticsearch_base_url = http://elasticsearch:9200/

	# This is the name of the ElasticSearch index used by CollectiveAccess.
	search_elasticsearch_index_name = collectiveaccess

Then just build and run:

    make build
    make start


## Memory

You may have to set this on your host machine:

    sudo sysctl -w vm.max_map_count=262144

