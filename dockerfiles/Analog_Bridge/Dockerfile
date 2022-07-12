FROM alpine AS builder

RUN set +x \
 && apk update && apk upgrade \
 && apk add git \
 && git clone https://github.com/DVSwitch/Analog_Bridge.git

FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN set +x \
 && apt-get update && apt-get upgrade -y \
 && apt-get install -y libsndfile1 libasound2 \
 && mkdir -p /app /data
COPY --from=builder /Analog_Bridge/bin/Analog_Bridge.amd64 /app/Analog_Bridge

WORKDIR /app
CMD /app/Analog_Bridge /data/Analog_Bridge.ini
