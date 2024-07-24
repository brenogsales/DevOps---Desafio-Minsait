#!/bin/bash

# Atualiza os pacotes.
sudo apt update -y

# Instala o Docker.
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Instala o Docker Compose.
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Cria o diretório para os arquivos do Docker.
mkdir -p /home/ubuntu/devops

# Cria o arquivo 'docker-compose.yml' dentro do diretório 'devops'.
cat <<EOF | sudo tee /home/ubuntu/devops/docker-compose.yml
version: '3.7'

services:
  wordpress:
    build: .
    restart: always
    ports:
      - 80:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_NAME: wordpress-db
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: GAud4mZby8F3SD6P
    volumes:
      - wordpress_data:/var/www/html

  db:
    image: mysql:5.7
    restart: always
    ports:
      - 3306:3306
    environment:
      MYSQL_ROOT_PASSWORD: GAud4mZby8F3SD6P
      MYSQL_DATABASE: wordpress-db
    volumes:
      - db_data:/var/lib/mysql

volumes:
  wordpress_data:
  db_data:
EOF

# Cria o arquivo 'Dockerfile' dentro do diretório 'devops'.
cat <<EOF | sudo tee /home/ubuntu/devops/Dockerfile
FROM wordpress:latest

EXPOSE 80
EOF

# Muda para o diretório do 'devops'.
cd /home/ubuntu/devops

# Sobe os containers com Docker Compose.
sudo docker-compose up -d
