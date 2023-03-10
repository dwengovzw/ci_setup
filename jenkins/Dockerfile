FROM jenkins/jenkins:lts

ARG DOCKERGID

USER root
RUN apt-get update && apt-get install -y iputils-ping chromium tree nano curl sudo ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils
RUN curl https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar xvz -C /tmp/ && mv /tmp/docker/docker /usr/bin/docker
RUN curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod 755 /usr/local/bin/docker-compose

RUN usermod -a -G sudo jenkins

# Create docker group, add jenkins user, and update group id.
RUN groupadd docker
RUN usermod -a -G docker jenkins
RUN newgrp docker
# Set the docker group id equal to the host docker group id
# More info https://stackoverflow.com/a/55578829/13057688
RUN groupmod -g ${DOCKERGID} docker  

RUN echo 'kernel.unprivileged_userns_clone=1' > /etc/sysctl.d/userns.conf
RUN echo "jenkins ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers



USER jenkins

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt