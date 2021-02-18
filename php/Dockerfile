ARG php_version=7.3-fpm

FROM chialab/php-dev:${php_version}

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
ENV NVM_DIR=/root/.nvm
ARG node_version=12
RUN . $HOME/.nvm/nvm.sh && nvm install ${node_version} && nvm alias default ${node_version} && nvm use default

RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates imagemagick libmagickwand-dev htop vim curl git unzip &&\
    rm -rf /var/lib/apt/lists/*
RUN pecl install imagick
RUN docker-php-ext-enable imagick
RUN curl -Lsf 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -
ENV PATH /usr/local/go/bin:$PATH
RUN go get github.com/mailhog/mhsendmail
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail
RUN echo 'sendmail_path = /usr/bin/mhsendmail --smtp-addr mailhog:1025' > /usr/local/etc/php/php.ini

WORKDIR /var/www/html
EXPOSE 9000 3000 8080 9090 3001 443 22 80
