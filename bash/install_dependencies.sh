#!/bin/bash
sudo yum install tomcat -y
sudo yum -y install httpd
sudo tee /etc/httpd/conf.d/tomcat_manager.conf > /dev/null << EOF
<VirtualHost *:80>
    ServerAdmin root@localhost
    ServerName app.wildrydes.com
    DefaultType text/html
    ProxyRequests off
    ProxyPreserveHost On
    ProxyPass / http://localhost:8080/unicorn-web-project/
    ProxyPassReverse / http://localhost:8080/unicorn-web-project/
</VirtualHost>
EOF

