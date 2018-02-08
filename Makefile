.PHONY:

integrate:
	# gtfs-csv2rdf ./datasets/1007-bus-lines-suburban/google_transit_extraurbano_tte.zip http://data.gtfs.org/sample-feed/0.1/
	cd ./datasets/1001-meteo-stations && sparql-integrate --sparql=listaStazioni.sparql
	# cd ./datasets/1012-2015-road-sensor-traffic/ && sparql-integrate --sparql=riassuntodatitrafficoanno2015.sparql
	# cd datasets/1037-cultural-events && sparql-integrate --sparql=100.sparql
