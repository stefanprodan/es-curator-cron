FROM alpine:latest

RUN apk --update add python py-setuptools py-pip && \
    pip install elasticsearch-curator==5.4.0 && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/curator_cli"]
