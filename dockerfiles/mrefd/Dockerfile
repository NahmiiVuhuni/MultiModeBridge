FROM alpine

RUN set +x \
 && apk --no-cache update && apk --no-cache upgrade \
 && apk --no-cache add git --virtual .build \
 && apk --no-cache add tcpdump bash libgcc libstdc++ \
 && mkdir -p /app /data \
 && git clone https://github.com/n7tae/mrefd.git /app \
 && apk --no-cache del .build
COPY startup /startup

WORKDIR /app
CMD /startup
