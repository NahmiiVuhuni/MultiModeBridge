FROM python:3.10-alpine

RUN mkdir /dummy

RUN adduser -D -u 54000 radio
RUN apk update && apk add git gcc musl-dev && cd /opt && git clone https://gitlab.hacknix.net/vk2way/FreeDMR.git freedmr
RUN cd /opt/freedmr && pip install --no-cache-dir -r requirements.txt && chown -R radio /opt/freedmr


USER radio
COPY entrypoint /entrypoint
ENTRYPOINT [ "/entrypoint" ]
