#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
echo "Hello From ${instance_name}" > /var/www/html/index.html