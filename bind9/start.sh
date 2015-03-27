#/bin/bash

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


PackageInstalledCheck bind9

cp -r zone/ /etc/bind
cp named.conf.local /etc/bind
service bind9 restart
echo "bind9 setting is complete"
