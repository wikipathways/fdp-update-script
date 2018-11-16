#!/bin/bash

#SPECIES = ()
#DATATYPES = (GPML GMT RDF SVG)

function string_replace {
    echo "${1/\*/$2}"
}


curl -X PATCH --header 'Content-Type: text/turtle' --header 'Accept: application/json' -d '@fdp.template.ttl' 'http://fdp.wikipathways.org/fdp/'
#it's working but check if it should be post
curl -X PATCH --header 'Content-Type: text/turtle' --header 'Accept: application/json' -d '@catalog.template.ttl' 'http://fdp.wikipathways.org/fdp/catalog?id=wikipathways'
#it's working but check if it should be post
curl -X PATCH --header 'Content-Type: text/turtle' --header 'Accept: application/json' -d '@dataset.template.ttl' 'http://fdp.wikipathways.org/fdp/dataset?id=wikipathways'


for D in `find . -type d`
do
    for F in `find . -type f`
    do
	datasetTemplate=$(<dataset.template.ttl)
	datasetTemplate=$(echo $datasetTemplate | sed 's/bb/aa/g')
	echo $datasetTemplate > tempDataset.ttl
    	#curl -X POST --header 'Content-Type: text/turtle' --header 'Accept: text/plain' -d '@tempDataset.ttl' 'http://fdp.wikipathways.org/fdp/dataset?id=$D'
    done
done


