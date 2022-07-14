FROM alpine AS builder

RUN set +x \
 && apk update && apk upgrade \
 && apk add git build-base \
 && git clone https://github.com/g4klx/P25Clients.git \
 && cd /P25Clients/P25Reflector \
 && make clean all \
 && chmod +x P25Reflector

FROM alpine

RUN set +x \
 && apk --no-cache update && apk --no-cache upgrade \
 && apk --no-cache add tcpdump libgcc libstdc++ \
 && mkdir -p /app /data
COPY --from=builder /P25Clients/P25Reflector/P25Reflector /app/P25Reflector
COPY --from=builder /P25Clients/P25Reflector/DMRIds.dat /app/DMRIds.dat

WORKDIR /app
CMD /app/P25Reflector /data/P25Reflector.ini
