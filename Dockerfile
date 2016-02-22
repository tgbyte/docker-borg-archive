FROM tgbyte/cron

RUN apt-get update && \
    apt-get install -y lftp

ADD entrypoint.d/ /entrypoint.d

RUN adduser --uid 500 --disabled-password --gecos "Borg Backup" --quiet borg
RUN mkdir /backup

VOLUME /var/backups/borg
