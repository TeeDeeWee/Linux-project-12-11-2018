#!/bin/bash
echo "Installatie van Logstash."
echo "deb http://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list
echo "Updaten van de package database."
sudo apt-get update
echo "Installere van Logstash package."
sudo apt-get install logstash
echo "Configureren van logstash."
sudo mkdir -p /etc/pki/tls/certs
sudo mkdir -p /etc/pki/tls/private
echo "subjectAltName = IP: 192.168.56.101" >> /etc/ssl/openssl.cnf
echo "Genereren van SSL certificaat."
cd /etc/pki/tls
sudo openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt
echo "Maken van config files."
echo "input {
  beats {
    port => 5044
    ssl => true
    ssl_certificate => "/etc/pki/tls/certs/logstash-forwarder.crt"
    ssl_key => "/etc/pki/tls/private/logstash-forwarder.key"
  }
}" >> /etc/logstash/conf.d/02-beats-input.conf
echo "output {
  elasticsearch {
    hosts => ["localhost:9200"]
    sniffing => true
    manage_template => false
    index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
    document_type => "%{[@metadata][type]}"
  }
}" >> /etc/logstash/conf.d/30-elasticsearch-output.conf
echo "Herstarten van logstash service."
sudo systemctl restart logstash
sudo systemctl enable logstash
sudo systemctl status logstash
