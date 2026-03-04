#!/bin/bash

# A script to set up a vulnerable Ubuntu server for testing and educational purposes

# Update and upgrade the system
apt-get update && apt-get upgrade -y

# Install some vulnerable packages
apt-get install -y apache2
apt-get install -y mysql-server
apt-get install -y vsftpd
apt-get install -y nfs-kernel-server
apt-get install -y openvpn

# Configure Apache
echo '<?php phpinfo(); ?>' > /var/www/html/info.php

# Start services
service apache2 start
service mysql start
service vsftpd start
service nfs-kernel-server start

# Print completion message
echo 'Vulnerable Ubuntu server setup complete!'