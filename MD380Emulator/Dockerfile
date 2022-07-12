FROM debian:bullseye-slim AS builder

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN set +x \
 && apt-get update && apt-get upgrade -y \
 && apt-get install -y curl wget build-essential git gcc-arm-linux-gnueabihf unzip libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev build-essential bison flex libssl-dev bc python \
 && git clone https://github.com/DVSwitch/md380tools.git \
 && cd md380tools/emulator \
 && make clean all

FROM alpine

RUN set +x \
 && apk --no-cache update && apk --no-cache upgrade \
 && apk --no-cache add qemu-arm \
 && mkdir -p /app /data
COPY --from=builder /md380tools/emulator/md380-emu /app/md380-emu

WORKDIR /app
CMD qemu-arm /app/md380-emu -S 2470
