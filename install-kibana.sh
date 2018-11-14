#!/bin/bash
echo "Installatie van Kibana."
echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.5.x.list
echo "Updaten van de package database."
sudo apt-get update
echo "Installeren van Kibana package."
sudo apt-get -y install kibana
echo "Starten van de kibana service."
sudo update-rc.d kibana defaults 96 9
sudo systemctl start kibana
echo "Controleren van Kibana status."
sudo systemctl status kibana