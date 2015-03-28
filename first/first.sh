#apt update
aptitude update
aptitude upgrade
#set username
username="forhack"
useradd -s /bin/bash -m -d /home/"$username" -g root "$username"
passwd "$username"
cp sshd_config /etc/ssh/
echo "you must save in /etc/sudoers"
visudoo
service	ssh restart
