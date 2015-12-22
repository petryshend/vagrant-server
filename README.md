vagrant box add trusty64 https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box

### PostgreSQL ###
sudo -u postgres psql postgres
\password postgres
exit
sudo -u postgres createdb mydb