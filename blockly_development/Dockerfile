FROM node:18.12
# Install avr toolchain
RUN apt-get update && apt-get install -y binutils gcc-avr avr-libc uisp avrdude flex byacc bison
# COPY ./config/.env  /home/node/env/.env
RUN chown -R node:node /home/node
