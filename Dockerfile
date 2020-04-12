FROM alpine:3.11.5
LABEL mantainer=dev.oz

COPY --chown=1000 local.env /usr/share/raspi-provision/
COPY --chown=1000 ansible/ /usr/share/raspi-provision/
COPY --chown=1000 *.sh /usr/share/raspi-provision/

RUN apk update && \
\
apk add --no-cache ansible python3 openssh sshpass && \
\
addgroup -S ansiblegrp -g 1000 && adduser -S ansible -G ansiblegrp --uid 1000&& \
\
. /usr/share/raspi-provision/local.env

USER ansible

WORKDIR /usr/share/raspi-provision/
ENTRYPOINT ["sh", "/usr/share/raspi-provision/run.sh"]