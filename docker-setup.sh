# `python` is linked to 2.7 instead of 3, change that:
sudo ln -sf /usr/bin/python3 /usr/bin/python

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#### install docker
sudo apt-get update
sudo apt-get -y install docker docker.io docker-compose

#### alternative docker repo:
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
# sudo apt-get update
# sudo apt-get install docker-ce

#### make docker store its images and temp files on your large EBS storage:
# https://forums.docker.com/t/how-do-i-change-the-docker-image-installation-directory/1169
sudo systemctl stop docker.service
sudo mv /var/lib/docker /mnt/docker
sudo ln -s /mnt/docker /var/lib/docker
sudo systemctl start docker.service

#### Python stuff
sudo apt-get -y install python3-pip
sudo pip3 install docker-compose
sudo pip3 install -r requirements.txt

#### Change into your git repository AWS scripts
cd jupyter-datascience-notebook  # does this work within a bash script?
sudo make  # assuming you're in the git-cloned 

