## Timetable datasets


```bash
sh generate-workloads.sh > workloads.sparql
```

```bash
sparql-integrate workloads.sparql timetable-railway-conversion.sparql output.sparql
```

* [create-workloads.sh](create-workloads.sh) is a short bash script that creates a file with SPARQL INSERT statements based on the datasets in the subfolders 
* [workloads.sparql](workloads.sparql) is the result of running `create-workloads.sh`. It contains SPARQL INSERT statements that load the content of the workload datasets into the default graph
* [process.sparql](process.sparql) contains a sequence of SPARQL statements that process the workloads into triples in a result graph which is eventually written out to the console (on STDOUT)
* [show.sparql](show.sparql) just runs a SPARQL SELECT query which shows the time tables in table form (on STDERR) 

