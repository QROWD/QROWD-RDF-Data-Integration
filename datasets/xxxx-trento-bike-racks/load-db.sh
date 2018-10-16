limes bikeracks-comune-crowd.limes.xml
sparql-integrate geomize-bikeracks.sparql merge.sparql > '/tmp/tmp.nt'

#isql-vt 1111 dba dba 'EXEC=sparql clear graph <http://qrowd-project.eu/>'
#cst-virt-load.sh '/tmp/tmp.nt' http://qrowd-project.eu/ 1111 dba dba


