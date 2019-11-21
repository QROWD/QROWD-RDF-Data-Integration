#!/bin/bash

DATASET=$(basename "$(pwd)")
DATASET_CAMEL_CASE=$(echo "$DATASET" | sed -r 's/(^|-)(\w)/\U\2/g')
DATASET_TITLE=$(echo "$DATASET" | sed -r 's/(^|-)(\w)/\U \2/g')

echo "
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
PREFIX qrowd: <http://qrowd-project.eu/resource/>
INSERT DATA{
  qrowd:"$DATASET_CAMEL_CASE"Dataset
    a dcat:Dataset ;
    dct:identifier \"$DATASET\" ;
    dct:title \"$DATASET_TITLE\" ;
    dct:description \"Stuff\" ;
    dcat:keyword \"Keyword\", \"Keyword\" ;
    .
}
"

for DISTRIBUTION in distributions/*; do
  DISTRIBUTION_NAME=$(basename $DISTRIBUTION)
  echo "
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
PREFIX aws: <http://purl.oclc.org/NET/ssnx/meteo/aws/>
PREFIX qrowd: <http://qrowd-project.eu/resource/>
PREFIX qrowd-vocab: <http://qrowd-project.eu/vocab/>
INSERT {
  qrowd:"$DATASET_CAMEL_CASE"Dataset
    dcat:distribution qrowd:resource-$DISTRIBUTION_NAME ;
    .  

  qrowd:resource-$DISTRIBUTION_NAME
    a dcat:Distribution ;
#   dct:identifier \"$DISTRIBUTION_NAME\" ;
    dct:title \"$DISTRIBUTION_NAME\" ;
    dct:description \"RDF dataset with timetables for $DISTRIBUTION_NAME\" ;
# Hijacking the dcat namespace to refer to a set of graphs within this dataset
    dcat:accessURL qrowd:graph-$DISTRIBUTION_NAME ;
    .

  qrowd:workload-$DISTRIBUTION_NAME
    qrowd-vocab:workload ?workload ;
    qrowd-vocab:resultGraph qrowd:graph-$DISTRIBUTION_NAME ;
    .

}
WHERE {
  <$DISTRIBUTION> url:text ?workload .
}
"
done
