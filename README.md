# QROWD RDF Data Integration
This repository contains RDF conversions for many of the public datasets used in the [QROWD project](http://qrowd-project.eu).
Most datasets are related to Trento (Italy).

* [Table of Datasets](https://docs.google.com/spreadsheets/d/1TuDj3OzJyrLbJaM3MVKwKR4L3B5cjyIoofVM3Fw9nsM/edit#gid=1481713892).
* Most conversions are performed using the [Sparqlintegrate tool](https://github.com/SmartDataAnalytics/Sparqlintegrate), which means that the conversion scripts are sequences of SPARQL queries that make use of function extensions for dealing with heterogeneous data. The extensions are documented in this [SPARQL extensions reference guide](https://github.com/SmartDataAnalytics/jena-sparql-api/tree/master/jena-sparql-api-sparql-ext).
* The folder Datasets has example Data and a sparql query for every dataset.

## 1007 and 1008

Converts with [OpenTransport/gtfs-csv2rdf: Mapping script which transforms GTFS CSV into GTFS RDF (turtle, jsonld or ntriples)](https://github.com/OpenTransport/gtfs-csv2rdf).

```sh
npm install -g gtfs-csv2rdf
```

## 1020 to 1033

[GeoKnow/TripleGeo: TripleGeo utility for converting geospatial data into triples](https://github.com/GeoKnow/TripleGeo)
