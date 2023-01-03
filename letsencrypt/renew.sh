sudo docker run -it --rm \
-v /docker-volumes/etc/letsencrypt:/etc/letsencrypt \
-v /docker-volumes/var/lib/letsencrypt:/var/lib/letsencrypt \
-v $PWD/html:/data/letsencrypt \
-v /docker-volumes/var/log/letsencrypt:/var/log/letsencrypt \
certbot/certbot \
certonly --webroot \
--email tom@dwengo.org --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
-d blockly.dwengo.org
