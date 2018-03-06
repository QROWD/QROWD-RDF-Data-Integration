for f in $(find -name '*.json');
do echo "INSERT {
  eg:workload1 eg:workload ?o
  }
  WHERE {
  <"$f"> url:text ?src .
  BIND(STRDT(?src, xsd:json) AS ?o)
  }" >> workload.sparql;
  sparql-integrate --sparql=workload.sparql --sparql=timetable-railway-conversion.sparql
  rm workload.sparql
done



