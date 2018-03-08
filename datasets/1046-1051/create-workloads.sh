#!/bin/bash
COUNTER=0
# https://stackoverflow.com/questions/2596462/how-to-strip-leading-in-unix-find
for f in $(find -name '*.json' | sed "s|^\./||"); do 
  echo "INSERT {
  eg:workload"$COUNTER" eg:workload ?o
}
WHERE {
  <"$f"> url:text ?src .
  BIND(STRDT(?src, xsd:json) AS ?o)
}

"
  let COUNTER=COUNTER+1 
done
#sparql-integrate --sparql=workload.sparql --sparql=timetable-railway-conversion.sparql
#rm workload.sparql


