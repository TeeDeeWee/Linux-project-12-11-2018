#!/bin/bash
echo "Installatie van Saltstack."
echo "Toevoegen van de Saltstack repository."
wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GP$
wget -P /etc/apt/sources.list.d/saltstack.list http://repo.saltstack.com/apt/ub$
echo "Updaten van de package index." 
sudo apt-get update
echo "Intallatie van de Saltminion."
yes | sudo apt-get install salt-minion
echo "Aanpassen van configuratie files."
echo "master: 192.168.56.101" >> /etc/salt/minion
echo "Herstarten van de Saltminion service."
sudo systemctl restart salt-minion
echo "De status van salt-minion weergeven."
sudo systemctl status salt-minion
echo "De insallatie en configuratie zijn voltooid."