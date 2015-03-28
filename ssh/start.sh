#first git remote is https but we should change to ssh
git remoteset-url origin git@github.com:leesanghyeok/Setting.git
#move the .ssh
cp -r .ssh ~/
