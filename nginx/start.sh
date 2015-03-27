#!/bin/bash

PackageInstalledCheck(){
	packagename=$1
	installstr="install ok installed"
	isinstalled=$(dpkg -s $packagename | grep "$installstr")
	if [ "$isinstalled" ] 
	then
		echo "$packagename is already installed"
	else
		aptitude install -y $packagename
	fi
}
#install nginx
PackageInstalledCheck nginx
#move available-site
sitedir="sites-available"
cp -r "$sitedir" /etc/nginx/
#enable available-site except copy-default
declare -a filelist
filelist=(`ls /etc/nginx/"$sitedir" | grep -v "copy-default"`)
for flist in ${filelist[*]}
do
	./ngensite "$flist"
done
#restart the server
nginx -s reload

