#!/bin/bash
COUNTER=0
# https://stackoverflow.com/questions/2596462/how-to-strip-leading-in-unix-find

#

echo "
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
INSERT DATA{
  eg:trentoRailwayTimeTablesDataset
    a dcat:Dataset ;
    dct:identifier \"trento-railway-time-tables\" ;
    dct:title \"Trento Railway Timetables\" ;
    dct:description \"Timetables\" ;
    dcat:keyword \"qrowd\", \"trento\", \"timetable\", \"railway\", \"rdf\" ;
    .
}

"

for f in $(find -name '*.json' | sed "s|^\./||"); do 
# TODO derive name - remove file extension, replace / with -

#g=${f%.*}
g=`dirname "$f"`

  echo "
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
INSERT {
  eg:trentoRailwayTimeTablesDataset
    dcat:distribution eg:resource-$g ;
    .  

  eg:resource-$g
    a dcat:Distribution ;
#    dct:identifier \"$g\" ;
    dct:title \"$g\" ;
    dct:description \"RDF dataset with timetables for $g\" ;
# Hijacking the dcat namespace to refer to a set of graphs within this dataset
    dcat:accessURL eg:graph-$g ;
    .

  eg:workload-$g
    eg:workload ?o ;
    eg:resultGraph eg:graph-$g ;
    .

}
WHERE {
  <$f> url:text ?src .
  BIND(STRDT(?src, xsd:json) AS ?o)
}

"
  let COUNTER=COUNTER+1 
done
#sparql-integrate --sparql=workload.sparql --sparql=timetable-railway-conversion.sparql
#rm workload.sparql


