#! /bin/bash

PWD=`pwd`

opscode=( 
	apache2 
	build-essential 
	git
	mysql
	openssl
	passenger_apache2
	runit 
	yum
)

echo '*.DS_Store' > .gitignore
echo '.vagrant'  >> .gitignore
for recipe in ${opscode[@]}
do
	ln -s "$PWD/opscode-cookbooks/$recipe" "$PWD/cookbooks/$recipe"
	echo "cookbooks/$recipe"  >> .gitignore
done