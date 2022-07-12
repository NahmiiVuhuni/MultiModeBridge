FROM alpine AS builder

RUN set +x \
 && apk update && apk upgrade \
 && apk add git build-base \
 && git clone https://github.com/g4klx/P25Clients.git \
 && cd /P25Clients/P25Gateway \
 && make clean all \
 && chmod +x P25Gateway

FROM alpine

RUN set +x \
 && apk --no-cache add libgcc libstdc++ \
 && mkdir -p /app /app/Audio /data
COPY --from=builder /P25Clients/P25Gateway/P25Gateway /app/P25Gateway
COPY --from=builder /P25Clients/P25Gateway/DMRIds.dat /app/DMRIds.dat
COPY --from=builder /P25Clients/P25Gateway/Audio/en_US.indx /app/Audio/en_US.indx
COPY --from=builder /P25Clients/P25Gateway/Audio/en_US.imbe /app/Audio/en_US.imbe

WORKDIR /app
CMD /app/P25Gateway /data/P25Gateway.ini
