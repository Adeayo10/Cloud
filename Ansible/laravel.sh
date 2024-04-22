#!/bin/bash
# # install composer
# sudo apt-get install -y composer

# copy laravelapp to /var/www/html
cp /home/ansible/laravelapp /var/www/html/laravelapp

# Navigate to the project directory
cd /var/www/html/laravelapp

# Ensure correct working directory
if [ $? -ne 0 ]; then
    echo "Failed to navigate to the project directory."
    exit 1
fi

 
# Download the installer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# Verify the installer SHA-384, which you can also cross-check here: https://composer.github.io/pubkeys.html
EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$EXPECTED_CHECKSUM') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

# Run the installer
php composer-setup.php

# Remove the installer
php -r "unlink('composer-setup.php');"

# Move composer.phar to a directory that is in your path:
sudo mv composer.phar /usr/local/bin/composer

# Install dependencies
composer install --optimize-autoloader --no-dev

# Secure MySQL installation
sudo mysql_secure_installation

# Log in to MySQL, create a new database, user, and grant privileges
sudo mysql -u root -p <<EOF
CREATE DATABASE laravel;
CREATE USER 'laraveluser'@'localhost' IDENTIFIED BY 'laravel';
GRANT ALL ON laravel.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
EOF

# Update .env file with database credentials
sed -i "s/DB_DATABASE=.*/DB_DATABASE=laravel/" /home/ansible/laravelapp/.env
sed -i "s/DB_USERNAME=.*/DB_USERNAME=laraveluser/" /home/ansible/laravelapp/.env
sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=laravel/" /home/ansible/laravelapp/.env

# Run migrations
cd  /var/www/html/laravelapp

# Copy .env.example to .env
cp /var/www/html/laravelapp/.env.example /var/www/html/laravelapp/.env

# Generate application key
php /var/www/html/laravelapp/artisan key:generate

# Run migrations
php /var/www/html/laravelapp/artisan migrate



# Exit with success
exit 0