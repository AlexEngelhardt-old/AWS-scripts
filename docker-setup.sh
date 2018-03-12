# `python` is linked to 2.7 instead of 3, change that:
sudo ln -sf /usr/bin/python3 /usr/bin/python

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# install docker
sudo apt-get update
sudo apt-get -y install docker docker.io docker-compose
# make docker store its images and temp files on your large EBS storage:
sudo echo 'export DOCKER_TMPDIR="/mnt/docker-tmp"' >> /etc/default/docker
sudo echo 'export DOCKER_OPTS="-g /mnt"' >> /etc/default/docker

sudo systemctl restart docker.service

# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
# sudo apt-get update
# sudo apt-get install docker-ce

sudo apt-get -y install python3-pip
sudo pip3 install docker-compose

sudo make



