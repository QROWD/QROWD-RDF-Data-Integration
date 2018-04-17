generate-data: 
	./create-workloads.sh
	sparql-integrate workloads.sparql process.sparql emit.sparql > dataset.nq
upload-data: generate-data
	dcat deploy ckan --host=$(CKAN_INSTANCE) --apikey=$(API_KEY) dataset.nq
