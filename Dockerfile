FROM alpine:latest
LABEL maintainer="Lukas Dietrich <lukas@lukasdietrich.com>"

RUN apk --no-cache add taskd taskd-pki

COPY scripts /scripts

ENV TASKDDATA /data
VOLUME ["${TASKDDATA}"]
EXPOSE 53589

ENTRYPOINT ["sh", "/scripts/run.sh"]
