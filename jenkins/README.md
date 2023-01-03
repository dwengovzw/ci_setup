## Get the initial password

sudo docker exec ${CONTAINER_ID or CONTAINER_NAME} cat /var/jenkins_home/secrets/initialAdminPassword 

CONTAINER_NAME = jenkins_server