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
PipInstalledCheck(){
	packagename=$1
	installstr="$packagename"
	isinstalled=$(pip list | grep "$installstr")
	if [ "$isinstalled" ] 
	then
		echo "$packagename is already installed"
	else
		pip install $packagename
	fi
}
IsFileCheck(){
	filename=$1
	isfileck=`ls $filename 2>/dev/null`
	if [ "$isfileck" ]
	then
		return 1 #yes
	else
		return 0 #no
	fi
}
declare -a installlist
installlist=(python python-pip)

for pack in ${installlist[*]}
do
	PackageInstalledCheck $pack
done

PipInstalledCheck butterfly

#move the butterfly init file at /etc/init/butterfly.conf
cp butterfly.conf /etc/init/butterfly.conf
#simbolic link the butterfly.conf in /etc/init.d/butterfly

IsFileCheck /etc/init.d/butterfly
if [ "$?" -eq "1" ]
then
	echo "File Existed"	
else
	ln -s ../init/butterfly.conf /etc/init.d/butterfly
	echo "create the link"
fi
