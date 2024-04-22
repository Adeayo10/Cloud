#!/bin/bash

# Update packages
sudo apt-get update

# Install Apache
sudo apt-get install -y apache2

# Install MySQL
sudo apt-get install -y mysql-server

# Install PHP
sudo apt-get install -y php libapache2-mod-php php-mysql

 #Enable Apache PHP module
sudo a2enmod php7.4

#Clone PHP application from GitHub
sudo git clone https://github.com/laravel/laravel /home/ansible/laravelapp

# Set up permissions for Laravel storage and bootstrap/cache directories
sudo chown -R www-data:www-data /home/ansible/laravelapp/storage /home/ansible/laravelapp/bootstrap/cache
sudo chmod -R 775 /home/ansible/laravelapp/storage /home/ansible/laravelapp/bootstrap/cache

# Copy laravel.sh to the Laravel application directory
cp /home/ansible/laravel.sh /home/ansible/laravelapp/laravel.sh
chmod +x /home/ansible/laravelapp/laravel.sh

# Execute laravel.sh script
/home/ansible/laravelapp/laravel.sh

# Configure Apache virtual host for Laravel application
echo "<VirtualHost *:80>
    DocumentRoot /var/www/html/laravelapp/public
    <Directory /var/www/html/laravelapp/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>" | sudo tee /etc/apache2/sites-available/laravel.conf

# Enable the Laravel site
sudo a2ensite laravel.conf

# Enable the Apache rewrite module
sudo a2enmod rewrite

# Restart Apache to apply the changes
sudo systemctl restart apache2

# Configure MySQL
sudo systemctl enable mysql
sudo systemctl start mysql

# # Create a database for the Laravel application
# sudo mysql
# CREATE DATABASE laravel;
# CREATE USER 'laraveluser'@'localhost' IDENTIFIED BY 'laravel';
# GRANT ALL ON laravel.* TO 'laraveluser'@'localhost';
# FLUSH PRIVILEGES;
