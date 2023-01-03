## Info

This container is only run the first time you want to get a certificate using letsencrypt.
Start it using the command in the current directory:

docker build -t lets-encrypt-apache .
docker-compose up -d

While the container is running, run the renew.sh script.

Stop the container using:

docker-compose down

### Autorenew

To setup autorenew, add a cron job with the renew.sh script as target.
