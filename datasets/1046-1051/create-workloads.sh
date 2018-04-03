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
    .
}

"

for f in $(find -name '*.json' | sed "s|^\./||"); do 
# TODO derive name - remove file extension, replace / with -

  echo "
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
INSERT {
  eg:trentoRailwayTimeTablesDataset
    dcat:distribution eg:resource${COUNTER} ;
    .  

  eg:resource${COUNTER}
    a dcat:Distribution ;
    dct:identifier \"$f\" ;
    rdfs:label \"TODO label\" ;
    rdfs:comment \"TODO comment\" ;
    eg:workload ?o ;
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


