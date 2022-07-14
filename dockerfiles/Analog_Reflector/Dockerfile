FROM alpine AS builder

RUN set +x \
 && apk update && apk upgrade \
 && apk add git bash openssl curl bind-tools python3 \
 && git clone https://github.com/DVSwitch/Analog_Reflector.git \
 && mv /Analog_Reflector/bin/Analog_Reflector.amd64 /Analog_Reflector/opt/Analog_Reflector/Analog_Reflector \
 && cd /Analog_Reflector/opt/Analog_Reflector/ssl \
 && bash mkcerts.sh

FROM alpine

RUN set +x \
 && apk --no-cache update && apk --no-cache upgrade \
 && apk --no-cache add tcpdump bash \
 && mkdir -p /var/log/dvswitch
COPY --from=builder /Analog_Reflector/opt/Analog_Reflector /app
COPY startup /startup

CMD /startup
