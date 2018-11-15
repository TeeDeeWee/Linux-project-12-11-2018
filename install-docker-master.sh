#!/bin/bash
echo "Installatie van Docker."
echo "Benodigde packages installeren."
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
echo "Toevoegen van de repository."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
echo "Updaten van de package index."
sudo apt-get update
echo "De juiste repository kiezen."
apt-cache policy docker-ce
echo "Installeren van Docker."
sudo apt-get install -y docker-ce
echo "De status van Docker controleren."
sudo systemctl status docker