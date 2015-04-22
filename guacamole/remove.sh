# stop guacd,tomcat7
service guacd stop
service tomcat7 stop
# turn on the tomcat after finished
#remove the associate path with guacamole
rm -r /var/lib/guacamole
rm -r /usr/share/tomcat7/.guacamole
rm -r /etc/guacamole


