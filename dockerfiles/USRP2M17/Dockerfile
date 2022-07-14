FROM alpine AS builder

RUN set +x \
 && apk update && apk upgrade \
 && apk add git build-base \
 && git clone https://github.com/juribeparada/MMDVM_CM.git \
 && cd MMDVM_CM/USRP2M17 \
 && make \
 && chmod +x USRP2M17

FROM alpine

RUN set +x \
 && apk --no-cache update && apk --no-cache upgrade \
 && apk --no-cache add tcpdump libgcc libstdc++ \
 && mkdir -p /app /data
COPY --from=builder MMDVM_CM/USRP2M17/USRP2M17 /app/USRP2M17

WORKDIR /app
CMD /app/USRP2M17 /data/USRP2M17.ini
