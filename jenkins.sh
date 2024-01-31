#!/bin/bash

# install jenkins
echo "Jenkins Process Start"
sudo apt-get update -y
sudo apt install openjdk-11-jdk -y
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' 
sudo gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv 5BA31D57EF5975CA
sudo gpg --export --armor 5BA31D57EF5975CA | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw enable 
echo "Successfully Installed Jenkins in Your OS"

# then install git
sudo apt-get install git -y


#finally install kubectl
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
