#!/bin/bash

if [ $# -eq 0  ]; then
    echo "No arguments supplied, exiting script"
    echo "Please provide tag name as input parameter"
    exit 0
fi

function gerar_tag_master {

	echo "Gerando tag para $1"

	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')	
	
	git stash
	
	git fetch --all

	git checkout master

	git pull https://github.com/pensandoodireito/$1.git master

	git tag -a $2 -m "Tag para sprint $2. Visualize o changelog no github em https://github.com/pensandoodireito/participacao-sitebase"
	
	git push https://github.com/pensandoodireito/$1.git --tags

	git push origin master

	git checkout $branch

	git stash pop 
}

cd ..

gerar_tag_master participacao-sitebase $1

cd src/wp-content/themes/participacao-tema

gerar_tag_master participacao-tema $1

cd ../pensandoodireito-tema

gerar_tag_master pensandoodireito-tema $1

cd ../marcocivil-tema

gerar_tag_master marcocivil-tema $1

cd ../dadospessoais-tema

gerar_tag_master dadospessoais-tema $1

cd ../debatepublico-tema

gerar_tag_master debatepublico-tema $1

cd ../blog-tema

gerar_tag_master blog-tema $1

cd ../../plugins/pensandoodireito-network-functions

gerar_tag_master pensandoodireito-network-functions $1

cd ../wp-side-comments

gerar_tag_master wp-side-comments $1

cd ../delibera

gerar_tag_master delibera $1

