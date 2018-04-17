SUBDIRS := $(dir $(wildcard datasets/*/Makefile))
export CKAN_INSTANCE=ckan
export API_KEY=key

upload-data: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) upload-data -C $@

.PHONY: all $(SUBDIRS)

integrate:
	# gtfs-csv2rdf ./datasets/1007-bus-lines-suburban/google_transit_extraurbano_tte.zip http://data.gtfs.org/sample-feed/0.1/
	# cd ./datasets/1001-meteo-stations && sparql-integrate --sparql=listaStazioni.sparql
	# cd ./datasets/1022-paid-parking-zones && sparql-integrate --sparql=zone_parcheggio.sparql
	cd ./datasets/1024-disability-parking-zones && sparql-integrate --sparql=parcheggi_disabili.sparql
	# cd ./datasets/1012-2015-road-sensor-traffic/ && sparql-integrate --sparql=riassuntodatitrafficoanno2015.sparql
	# cd datasets/1037-cultural-events && sparql-integrate --sparql=100.sparql
