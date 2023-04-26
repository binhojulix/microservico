#!/bin/bash

# Install Java
sudo apt install openjdk-11-jre -y

# Add Jenkins package signing key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository to sources list
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists and install Jenkins
sudo apt-get update && sudo apt-get install jenkins -y

# Restart Jenkins service
sudo service jenkins restart


curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh
