#setting first
cd first
./first.sh
#install butterfly
cd butterfly
./start.sh
#install bind9
cd ../bind9
./start.sh
#install nginx
cd ../nginx
./start.sh
#install guacamole
cd ../guacamole
./start.sh
#install ssh
cd ../ssh
./start.sh

reboot
