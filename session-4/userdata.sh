#!/bin/bash
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo echo '${env} Instance is running' >> /var/www/html/index.html