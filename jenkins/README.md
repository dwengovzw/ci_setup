## Get the initial password

sudo docker exec ${CONTAINER_ID or CONTAINER_NAME} cat /var/jenkins_home/secrets/initialAdminPassword 

CONTAINER_NAME = jenkins_server

More info about socket sharing between host and child containers: # https://stackoverflow.com/a/55578829/13057688