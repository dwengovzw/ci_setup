FROM node:24.14
# Install avr and arm toolchains
RUN apt-get update && apt-get install -y \
    binutils gcc-avr avr-libc uisp avrdude flex byacc bison xxd \
    gcc-arm-none-eabi libnewlib-arm-none-eabi
# Install CMSIS core headers (core_cm4.h etc.) required for ARM Cortex-M compilation
RUN curl -sL https://github.com/ARM-software/CMSIS_5/archive/refs/tags/5.9.0.tar.gz -o /tmp/cmsis.tar.gz && \
    tar xzf /tmp/cmsis.tar.gz -C /tmp && \
    cp /tmp/CMSIS_5-5.9.0/CMSIS/Core/Include/* /usr/lib/arm-none-eabi/include/ && \
    rm -rf /tmp/cmsis.tar.gz /tmp/CMSIS_5-5.9.0
# COPY ./config/.env  /home/node/env/.env
RUN chown -R node:node /home/node
