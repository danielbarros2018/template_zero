#!/bin/bash
set -e

echo "Checking if is a new instalation..."
if [ ! -d "app" ]; then
    echo "Installing Laravel..."
    composer create-project --prefer-dist laravel/laravel .
    echo "Setting some configs..."
fi

echo "Checking if vendor directory exists..."
if [ ! -d "vendor" ]; then
    echo "Running composer install..."
    composer install --no-dev --optimize-autoloader
fi

if [ -d "storage" ]; then
    chmod -R 777 storage
fi
if [ -d "bootstrap/cache" ]; then
    chmod -R 777 bootstrap/cache
fi

exec "$@"