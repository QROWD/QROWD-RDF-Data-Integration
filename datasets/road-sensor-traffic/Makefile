generate-data: 
	rm -f workloads.sparql
	./create-workloads.sh > workloads.sparql
	sparql-integrate workloads.sparql process.sparql emit.sparql > dataset.nq
upload-data: generate-data
	dcat deploy ckan --url=$(CKAN_INSTANCE) --apikey=$(API_KEY) dataset.nq
