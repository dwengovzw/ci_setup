# ci_setup
Docker setup for continuous integration server for nodejs application

## Architecture

The setup has the following components (all running in their own docker container):
- (apache) An ***Apache** web server acting as a proxy to the external world. It is responsible for passing request to other containers.
- (apache_ssl) Same as the (apache) container but can be configured to use ssl with letsencrypt.
- (mongodb) A container running a ***mongodb** instance.
- (jenkins) A container running **jenkins**. This container is responsible for the CI/CD setup. It has a Jenkinsfile that is configured to download a nodejs source repository, build it, test it, and deploy it to the (blockly_development) container
- (blockly_development) A nodejs container for running the application.
- (blockly_staging) same as (blockly_development but for staging branch)


## Setup
- Install docker on your development machine accoring to the official instructions (https://docs.docker.com/engine/install/ubuntu/)
- To run docker without sudo add your user to the docker group
```bash
sudo groupadd docker
sudo usermod -aG docker ${USER}
```
login and logout for changes to take effect.
- Pull the CI/CD setup from github: 
```bash
mkdir deploy
git clone https://github.com/dwengovzw/ci_setup.git ./deploy
cd deploy
```
- install docker-compose:
```bash
sudo apt  install docker-compose
```

- Create a folder *environments* and add the files *dev.env*, *stagign.env*, *test.env*, and *prod.env* with the correct configurations for your application. (you could also copy them from somwhere else ex. using scp)

- Update the docker-compose.yml file to match your server hostname

### Get ssl certificates using Letsencrypt
- Change the server_name config in the /letsencrypt/docker-compose.yml file to match your server hostname.
- Navigate to the letsencrypt folder, build the image, and start the container:
```bash
cd letsencrypt
docker build -t lets-encrypt-apache . # This command might need the --network host argument (https://github.com/gliderlabs/docker-alpine/issues/307#issuecomment-427246497)
docker-compose up -d
```
- While the server is running, start the certbot docker container:
```bash
sudo docker run -it --rm \
-v /docker-volumes/etc/letsencrypt:/etc/letsencrypt \
-v /docker-volumes/var/lib/letsencrypt:/var/lib/letsencrypt \
-v $PWD/html:/data/letsencrypt \
-v /docker-volumes/var/log/letsencrypt:/var/log/letsencrypt \
certbot/certbot \
certonly --webroot \
--email [your_email] --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
-d [your_server_name] -d [your_server_alias]
```


sudo docker run -it --rm \
-v /docker-volumes/etc/letsencrypt:/etc/letsencrypt \
-v /docker-volumes/var/lib/letsencrypt:/var/lib/letsencrypt \
-v $PWD/html:/data/letsencrypt \
-v /docker-volumes/var/log/letsencrypt:/var/log/letsencrypt \
certbot/certbot \
certonly --webroot \
--email tom@dwengo.org --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
-d blockly-staging.dwengo.org

### Starting the production server
- Go to the apache_ssl folder.
- Update the server_name in the Dockerfile
- Open the httpd.conf file and update the proxy passes according to your needs. The default uses /development, /staging, and /jenkins for development, staging, and jenkins servers respectively. You could add other redirects f.e. to the mongodb db.
- Go back to the root of the repository and edit the docker-compose.yml file:
- Comment out the secure_web service and put the web service in comments
- Update the server_name config under the environment settings
- Update the volumes which contain the blockly-staging.dwengo.org part and repace it with your server name. (TODO: update this to be cleaner)
- Update the deploy.sh script by commenting out the line for the apache server and commenting in the line for the apache_ssl server.
- run 
```bash
sh deploy.sh
```
- If this hangs add the *-network host* flag to all the build commands in the script.

## Usage

- Run deploy.sh in the root directory of this repository.
- Update the /jenkins/Jenkinsfile.[build] to suit your CI/CD needs.
- Access jenkins on [hostname]:8081/jenkins.
- Create a new ***pipline** in jenkins.
- In the configuration menu under **Pipeline** select **Pipeline from SCM**.
- Add the referenct to this repo (f.e. https://github.com/dwengovzw/ci_setup.git).
- Set script path to *jenkins/Jenkinsfile.[build]*