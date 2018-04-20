generate-data: 
	sparql-integrate listaStazioni.sparql > dataset.nq
upload-data: generate-data
	dcat deploy ckan --host=$(CKAN_INSTANCE) --apikey=$(API_KEY) dataset.nq
