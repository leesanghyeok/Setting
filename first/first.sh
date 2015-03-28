#apt update
aptitude update
aptitude -y upgrade
#set username
username="$1"
if [ "$username" ]
then
	useradd -s /bin/bash -m -d /home/"$username" -g root "$username"
	passwd "$username"
	cp sshd_config /etc/ssh/
	echo "you must save in /etc/sudoers"
	visudo
	service	ssh restart
else
	echo "please put the username"
fi


