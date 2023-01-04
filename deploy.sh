#!/bin/bash

# Build the required docker containers
#docker build -t secure_web_server ./apache_ssl  # Web server with ssl
cd apache
docker build -t web_server .  # Web server without ssl
cd ..
cd jenkins
docker build -t jenkins_server .  # Build jenkins container
cd ..
cd mongodb
docker build -t mongodb_server .  # Build jenkins container
cd ..
docker-compose up -d  # Start containers in deamon mode