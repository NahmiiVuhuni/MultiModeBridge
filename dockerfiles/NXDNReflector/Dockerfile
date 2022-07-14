FROM alpine AS builder

RUN set +x \
 && apk update && apk upgrade \
 && apk add git build-base \
 && git clone https://github.com/g4klx/NXDNClients.git \
 && cd /NXDNClients/NXDNReflector \
 && make clean all \
 && chmod +x NXDNReflector

FROM alpine

RUN set +x \
 && apk --no-cache update && apk --no-cache upgrade \
 && apk --no-cache add tcpdump libgcc libstdc++ \
 && mkdir -p /app /data
COPY --from=builder /NXDNClients/NXDNReflector/NXDNReflector /app/NXDNReflector
COPY --from=builder /NXDNClients/NXDNReflector/NXDN.csv /app/NXDN.csv

WORKDIR /app
CMD /app/NXDNReflector /data/NXDNReflector.ini
