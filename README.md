# QROWD RDF Data Integration
This repository contains RDF conversions for many of the public datasets used in the [QROWD project](http://qrowd-project.eu).
Most datasets are related to Trento (Italy).

* [Table of Datasets](https://docs.google.com/spreadsheets/d/1TuDj3OzJyrLbJaM3MVKwKR4L3B5cjyIoofVM3Fw9nsM/edit#gid=1481713892).
* Conversion is done mainly with [Sparqlintegrate](https://github.com/SmartDataAnalytics/Sparqlintegrate). Further [Documentation](https://github.com/SmartDataAnalytics/jena-sparql-api/tree/master/jena-sparql-api-sparql-ext) for Sparqlintegrate.
* The folder Datasets has example Data and a sparql query for every dataset.

## 1007 and 1008

Converts with [OpenTransport/gtfs-csv2rdf: Mapping script which transforms GTFS CSV into GTFS RDF (turtle, jsonld or ntriples)](https://github.com/OpenTransport/gtfs-csv2rdf).

```sh
npm install -g gtfs-csv2rdf
```

## 1020 to 1033

[GeoKnow/TripleGeo: TripleGeo utility for converting geospatial data into triples](https://github.com/GeoKnow/TripleGeo)
