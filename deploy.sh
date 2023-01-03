#!/bin/bash

# Build the required docker containers
#docker build -t secure_web_server ./apache_ssl  # Web server with ssl
docker build -t web_server ./apache  # Web server without ssl
docker build -t jenkins_server ./jenkins  # Build jenkins container
docker build -t mongodb_server ./mongodb  # Build jenkins container
docker-compose up -d  # Start containers in deamon mode