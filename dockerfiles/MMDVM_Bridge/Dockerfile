FROM alpine AS builder

RUN set +x \
 && apk update && apk upgrade \
 && apk add git \
 && git clone https://github.com/DVSwitch/MMDVM_Bridge.git

FROM debian:bullseye-slim

RUN set +x \
 && apt-get update && apt-get upgrade -y \
 && apt-get install tcpdump -y \
 && mkdir -p /app /data /data/log
COPY --from=builder /MMDVM_Bridge/bin/MMDVM_Bridge.amd64 /app/MMDVM_Bridge
COPY DMRIds.dat /app/DMRIds.dat
COPY NXDN.csv /app/NXDN.csv

WORKDIR /app
ENV DVSWITCH=/data/DVSwitch.ini
CMD /app/MMDVM_Bridge /data/MMDVM_Bridge.ini
