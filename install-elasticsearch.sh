#!/bin/bash
echo "Installatie van Elasticsearch."
echo "Installeren van de public signing key."
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "Installeren van benodigde packages."
sudo apt-get install default-jre
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
echo "Installeren van Elasticsearch package."
sudo apt-get update && sudo apt-get install elasticsearch
echo "Starten van Elasticsearch."
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch
echo "De status van elasticsearch controleren."
sudo systemctl status elasticsearch
