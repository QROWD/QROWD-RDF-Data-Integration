.PHONY: all

all: target/LinkedGeoData

target:
	mkdir target

target/LinkedGeoData: target
	git clone https://github.com/GeoKnow/LinkedGeoData.git target/LinkedGeoData
	cd target/LinkedGeoData && git checkout develop

start:
	#docker network create lgd-net
	#docker volume create lgd-db-vol
	#docker volume create lgd-osm-sync-vol
	#docker volume create lgd-nominatim-sync-vol
	cp env target/LinkedGeoData/linkedgeodata-docker/.env
	cd target/LinkedGeoData/linkedgeodata-docker/ && make && docker-compose up
	
