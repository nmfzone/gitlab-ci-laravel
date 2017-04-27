FROM ubuntu:16.04

LABEL maintainer "Nabil Muhammad Firdaus <123.nabil.dev@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

# Initial setup
RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        python-software-properties

# Add repositories through PPA
RUN add-apt-repository -y ppa:ondrej/php && \
    apt-get update

# Install essential packages
RUN apt-get install -y \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    wget \
    curl \
    build-essential \
    git \
    unzip \
    supervisor \
    mysql-client \
    openssh-client

# Install PHP 7.1
RUN apt-get install -y \
    php7.1-fpm \
    php7.1-cli \
    php7.1-curl \
    php7.1-mysql \
    php7.1-mcrypt \
    php7.1-mbstring \
    php7.1-dom \
    php7.1-xdebug \
    php7.1-tidy \
    php7.1-gd \
    php7.1-zip

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    mv composer.phar /usr/local/bin/composer && \
    php -r "unlink('composer-setup.php');"

# Install NodeJs
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && apt-get install -y nodejs

# Laravel Dusk support
RUN apt-get update && \
    apt-get -y install libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4 \
        chromium xvfb gtk2-engines-pixbuf xfonts-cyrillic xfonts-100dpi \
        xfonts-75dpi xfonts-base xfonts-scalable imagemagick x11-apps



# Display versions
RUN php -v
RUN composer -V
RUN nodejs -v
RUN npm -v
