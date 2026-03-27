FROM node:24.14
# Install avr and arm toolchains
RUN apt-get update && apt-get install -y \
    binutils gcc-avr avr-libc uisp avrdude flex byacc bison xxd \
    gcc-arm-none-eabi libnewlib-arm-none-eabi
# COPY ./config/.env  /home/node/env/.env
RUN chown -R node:node /home/node
