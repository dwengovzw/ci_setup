FROM node:24.14
# Install avr toolchain
RUN apt-get update && apt-get install -y binutils gcc-avr avr-libc uisp avrdude flex byacc bison xxd
# Install arm toolchain
RUN apt-get update && apt-get install -y gcc-arm-none-eabi libnewlib-arm-none-eabi
RUN ln -s /usr/bin/arm-none-eabi-g++ /bin/arm-none-eabi-g++
# COPY ./config/.env  /home/node/env/.env
RUN chown -R node:node /home/node
