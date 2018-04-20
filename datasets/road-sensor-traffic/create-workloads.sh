#!/bin/bash

DATASET=$(basename "$(pwd)")
DATASET_CAMEL_CASE=$(echo "$DATASET" | sed -r 's/(^|-)(\w)/\U\2/g')
DATASET_TITLE=$(echo "$DATASET" | sed -r 's/(^|-)(\w)/\U \2/g')

echo "
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
INSERT DATA{
  eg:"$DATASET_CAMEL_CASE"Dataset
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
INSERT {
  eg:"$DATASET_CAMEL_CASE"Dataset
    dcat:distribution eg:resource-$DISTRIBUTION_NAME ;
    .  

  eg:resource-$DISTRIBUTION_NAME
    a dcat:Distribution ;
#   dct:identifier \"$DISTRIBUTION_NAME\" ;
    dct:title \"$DISTRIBUTION_NAME\" ;
    dct:description \"RDF dataset with timetables for $DISTRIBUTION_NAME\" ;
# Hijacking the dcat namespace to refer to a set of graphs within this dataset
    dcat:accessURL eg:graph-$DISTRIBUTION_NAME ;
    .

  eg:workload-$DISTRIBUTION_NAME
    eg:workload ?workload ;
    eg:resultGraph eg:graph-$DISTRIBUTION_NAME ;
    .

}
WHERE {
  <$DISTRIBUTION> url:text ?workload .
}
"
done
