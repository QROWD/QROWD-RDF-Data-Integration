# QROWD RDF Data Integration

## Ckan uploads

This is accomplished using a python script

```bash
sudo apt-get update
sudo apt-get -y install python3-pip

sudo pip3 install rdflib

```
### Datasets

- [Table of Datasets](https://docs.google.com/spreadsheets/d/1TuDj3OzJyrLbJaM3MVKwKR4L3B5cjyIoofVM3Fw9nsM/edit#gid=1481713892)
- Most conversions are performed using the [Sparqlintegrate tool](https://github.com/SmartDataAnalytics/Sparqlintegrate), which means that the conversion scripts are sequences of SPARQL queries that make use of function extensions for dealing with heterogeneous data. The extensions are documented in this [SPARQL extensions reference guide](https://github.com/SmartDataAnalytics/jena-sparql-api/tree/master/jena-sparql-api-sparql-ext).
- The folder Datasets has example Data and a sparql query for every dataset.

### Input Formats

#### GTFS

- [General Transit Feed Specification - Wikipedia](https://en.wikipedia.org/wiki/General_Transit_Feed_Specification)
- [TransitFeeds - Public transit feeds from around the world](http://transitfeeds.com/)
- [OpenTransport/linked-gtfs: Separate repository for the Linked GTFS vocabulary](https://github.com/OpenTransport/linked-gtfs)
Can be converted and synced to OSM with: [gtfs-osm-sync](https://github.com/CUTR-at-USF/gtfs-osm-sync)

Conversion to RDF:
- [kasei/gtfs-rdf: Tools for converting GTFS data to RDF](https://github.com/kasei/gtfs-rdf)
- [OpenTransport/gtfs-csv2rdf: Mapping script which transforms GTFS CSV into GTFS RDF (turtle, jsonld or ntriples)](https://github.com/OpenTransport/gtfs-csv2rdf)

#### GML / SHP / KML /DXF

- [SmartDataAnalytics/SparqlIntegrate: SPARQL-based tool for the integration of heterogeneous data (JSON, CSV, XML)](https://github.com/SmartDataAnalytics/SparqlIntegrate)
