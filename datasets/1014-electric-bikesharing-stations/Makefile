generate-data: 
	sparql-integrate process.sparql > dataset.nq
upload-data: generate-data
	dcat deploy ckan --host=$(CKAN_INSTANCE) --apikey=$(API_KEY) dataset.nq
