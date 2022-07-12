FROM alpine AS builder

RUN set +x \
 && apk update && apk upgrade \
 && apk add git build-base \
 && git clone https://github.com/g4klx/NXDNClients.git \
 && cd /NXDNClients/NXDNGateway \
 && make clean all \
 && chmod +x NXDNGateway

FROM alpine

RUN set +x \
 && apk --no-cache add libgcc libstdc++ \
 && mkdir -p /app /app/Audio /data
COPY --from=builder /NXDNClients/NXDNGateway/NXDNGateway /app/NXDNGateway
COPY --from=builder /NXDNClients/NXDNGateway/NXDN.csv /app/NXDN.csv
COPY --from=builder /NXDNClients/NXDNGateway/Audio/en_US.indx /app/Audio/en_US.indx
COPY --from=builder /NXDNClients/NXDNGateway/Audio/en_US.nxdn /app/Audio/en_US.nxdn

WORKDIR /app
CMD /app/NXDNGateway /data/NXDNGateway.ini
