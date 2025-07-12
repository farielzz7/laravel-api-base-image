# Dockerfile.base

# Imagen base de PHP-FPM
FROM php:8.2-fpm

# Instalar dependencias del sistema y extensiones de PHP
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    curl \
    nginx \
    supervisor \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libpq-dev \
    libmcrypt-dev \
    && docker-php-ext-install pdo pdo_mysql zip exif pcntl bcmath \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && rm -rf /var/lib/apt/lists/*


# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


