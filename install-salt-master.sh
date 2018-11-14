#!/bin/bash
echo "Installatie van Saltstack."
echo "Toevoegen van de Saltstack repository."
wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GP$
wget -P /etc/apt/sources.list.d/saltstack.list http://repo.saltstack.com/apt/ub$
echo "Updaten van de package index."
sudo apt-get update
echo "Intallatie van de Saltmaster."
yes | sudo apt-get install salt-master
echo "Aanmaken van benodigde directories."
sudo mkdir -p /srv/{salt,pillar}
echo "Aanpassen van configuratie files."
echo "file_roots:
  base:
    - /srv/salt
    - /srv/formulas
pillar_roots:
  base:
    - /srv/pillar" >> /etc/salt/master
echo "Herstarten van de Saltmaster service."
sudo systemctl restart salt-master
echo "De status van salt-master weergeven."
sudo systemctl status salt-master
echo "De insallatie en configuratie zijn voltooid."