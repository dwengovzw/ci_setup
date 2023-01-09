#!/bin/bash

# Copy the environments settings to known folder on the host machine
# This might require root access or permission changes for this dir
# This directory will be mounted as a bind mout in the docker containers 
# so they can access the required environment settings.
cp ./environments/* /var/environments/

# Build the required docker containers
docker build --network host -t secure_web_server ./apache_ssl  # Web server with ssl
#docker build --network host -t web_server ./apache  # Web server without ssl
# Pass groupid of docker group to jenkins image so it can access the host docker socket
docker build --network host --build-arg DOCKERGID=`stat -c %g /var/run/docker.sock` -t jenkins_server ./jenkins  # Build docker container for jenkins
docker build --network host -t mongodb_server ./mongodb  # Build docker container for database

docker build --network host -t blockly_development_server ./blockly_development  # Build image for development deploy
docker build --network host -t blockly_staging_server ./blockly_development  # Build image for staging deploy

docker-compose up -d  # Start containers in deamon mode