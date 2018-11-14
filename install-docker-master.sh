#!/bin/bash
echo "Installatie van Docker."
echo "Toevoegen van de repository."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $lsb_release -cs) stable"
echo "Updaten van de package index."
sudo apt-get Update
echo "De juiste repository kiezen."
apt-cahe policy docker-ce
echo "Installeren van Docker."
sudo apt-get install -y docker-ce
echo "De status van Docker controleren."
sudo systemctl status docker