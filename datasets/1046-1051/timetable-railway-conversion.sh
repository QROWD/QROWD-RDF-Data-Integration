#!/bin/bash
COUNTER=0
for f in $(find -name '*.json'); do 
  echo "INSERT {
  eg:workload"$COUNTER" eg:workload ?o
  }
  WHERE {
  <"$f"> url:text ?src .
  BIND(STRDT(?src, xsd:json) AS ?o)
  }" >> workload.sparql
  let COUNTER=COUNTER+1 
done
sparql-integrate --sparql=workload.sparql --sparql=timetable-railway-conversion.sparql
rm workload.sparql


