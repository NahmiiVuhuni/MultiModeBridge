FROM alpine AS builder

RUN set +x \
 && apk update && apk upgrade \
 && apk add git build-base \
 && git clone https://github.com/g4klx/YSFClients.git \
 && cd /YSFClients/YSFReflector \
 && make clean all \
 && chmod +x YSFReflector

FROM alpine

RUN set +x \
 && apk --no-cache update && apk --no-cache upgrade \
 && apk --no-cache add tcpdump libgcc libstdc++ \
 && mkdir -p /app /data
COPY --from=builder /YSFClients/YSFReflector/YSFReflector /app/YSFReflector

WORKDIR /app
CMD /app/YSFReflector /data/YSFReflector.ini
