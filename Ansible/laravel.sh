#!/bin/bash

# Navigate to the project directory
cd /var/www/html/laravelapp

# Install dependencies
composer install

# Copy .env.example to .env
cp .env.example .env

# Generate application key
php artisan key:generate

# Run migrations
php artisan migrate

# Serve the application
php artisan serve