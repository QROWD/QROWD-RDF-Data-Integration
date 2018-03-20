#!/usr/bin/python3
import json
import os
import glob
import argparse
from pprint import pprint
from ckanapi import RemoteCKAN

# http://docs.ckan.org/en/latest/api/index.html#ckan.logic.action.create.resource_create

parser = argparse.ArgumentParser(description='CKAN uploader')

parser.add_argument('-c', '--config',
#            action="store", dest="query",
            help="config file", default="config.json")

args = parser.parse_args()


configFilename = args.config

config = json.load(open(configFilename))
pprint(config)
#quit()
ckanConfig = config['ckan'];
pprint(ckanConfig)

ckan = RemoteCKAN(ckanConfig['url'], ckanConfig['apiKey'], user_agent=ckanConfig['userAgent'])

#pprint([x for x in os.listdir(".") if x.endswith(".json")])
for filename in glob.iglob('**/*.json', recursive=True):
     print(filename)


#ua = 'ckanapiexample/1.0 (+http://example.com/my/website)'

print('package update')
ckan.action.package_update(
    name='my-test-dataset',
    title='this will work fine too')


print('resource update')
ckan.action.resource_create(
    id='my-resource',
    name='my-resource',
    package_id='my-test-dataset',
    url='dummy-value',  # ignored but required by CKAN<2.6
    upload=open('test.csv', 'rb'))




#ckan = ckanclient.CkanClient(base_location='http://ckan.qrowd.aksw.org/api', api_key='25b91078-fbc6-4b3a-93c5-acfce414bbeb')
#ckan.upload_file('testdata.csv')
#ckan.add_package_resource('mydatasetx', 'testdata.csv', resource_type='data', description='foobar')

#ckan.add_package_resource('my_dataset', 'http://example.org/foo.txt',
#            name='Foo', resource_type='metadata', format='csv')

