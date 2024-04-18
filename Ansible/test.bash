#!/bin/bash

# Update packages
sudo apt-get update

# Install Apache
sudo apt-get install -y apache2

# Install MySQL
sudo apt-get install -y mysql-server

# Install PHP
sudo apt-get install -y php libapache2-mod-php php-mysql

# Clone PHP application from GitHub
git clone https://github.com/laravel/laravel /home/vagrant/laravelapp

# Configure Apache
sudo systemctl enable apache2
sudo systemctl start apache2

# Configure Apache
echo "<VirtualHost *:80>
    DocumentRoot /home/vagrant/laravelapp/public
    <Directory /home/vagrant/laravelapp/public>
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>" | sudo tee /etc/apache2/sites-available/laravel.conf

sudo a2ensite laravel
sudo a2enmod rewrite
sudo systemctl restart apache2

# Configure MySQL
sudo systemctl enable mysql
sudo systemctl start mysql

# Create a new MySQL database for the Laravel application
sudo mysql -u root

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'vagrant';
CREATE DATABASE laravel;
GRANT ALL ON laravel.* TO 'laraveluser'@'localhost' IDENTIFIED BY 'vagrant';
FLUSH PRIVILEGES;
mysql -u root -p vagrant laravel < /home/vagrant/laravelapp/database/laravel.sql
exit


