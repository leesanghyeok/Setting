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
#declare
defaultname="guacamole-0.9.5"
clientname="$defaultname.war"
servername="guacamole-server-0.9.5"
tarservername="$servername.tar.gz"
#install
declare -a installlist
installlist=(libcairo2-dev libpng12-dev libossp-uuid-dev libfreerdp-dev libpango1.0-dev libssh2-1-dev libvncserver-dev libpulse-dev libssl-dev libvorbis-dev tomcat7 mysql-server)
for pack in ${installlist[*]}
do
	PackageInstalledCheck "$pack"
done
mkdir guac_mole
cd guac_mole
wget http://sourceforge.net/projects/guacamole/files/current/binary/"$clientname"
wget http://sourceforge.net/projects/guacamole/files/current/source/"$tarservername"
#//////server install and compile//////
tar -xzf "$tarservername"
rm "$tarservername"
cd "$servername"
./configure --with-init-dir=/etc/init.d
make
make install
ldconfig
cd ..
#//////deploying guacamole//////////
mkdir /var/lib/guacamole
mkdir /etc/guacamole
mkdir /usr/share/tomcat7/.guacamole
cp guacamole-0.9.5.war /var/lib/guacamole/guacamole.war
cp ../guacamole.properties /etc/guacamole/guacamole.properties
ln -s /var/lib/guacamole/guacamole.war /var/lib/tomcat7/webapps
ln -s /etc/guacamole/guacamole.properties /usr/share/tomcat7/.guacamole/
service tomcat7 restart
service guacd restart
cd ..
rm -r guac_mole
#////////mysql authentication//////////
wget http://sourceforge.net/projects/guacamole/files/current/extensions/guacamole-auth-mysql-0.9.5.tar.gz
wget http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.35.tar.gz
tar -xzf guacamole-auth-mysql-0.9.5.tar.gz
tar -xzf mysql-connector-java-5.1.35.tar.gz
rm guacamole-auth-mysql-0.9.5.tar.gz
rm mysql-connector-java-5.1.35.tar.gz
mkdir /var/lib/guacamole/classpath
cp guacamole-auth-mysql-0.9.5/lib/* /var/lib/guacamole/classpath/
cp mysql-connector-java-5.1.35/mysql-connector-java-5.1.35-bin.jar /var/lib/guacamole/classpath
#//////////setting the mysql/////////
echo "CREATE DATABASE guacamole;CREATE USER 'guac'@'%' IDENTIFIED BY 'wptjfdk';GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole.* TO 'guac'@'%';FLUSH PRIVILEGES;" | mysql -u root --password=wptjfdk
cat guacamole-auth-mysql-0.9.5/schema/*.sql | mysql -u root -p guacamole
rm -r guacamole-auth-mysql-0.9.5/
rm -r mysql-connector-java-5.1.35/
#//////////setting the tomcat7///////
cp server.xml /etc/tomcat7/server.xml
echo "complete the guacamole setting!"
