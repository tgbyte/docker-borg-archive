#!/bin/sh
echo "open -u ${FTP_USER},${FTP_PASSWORD} ${FTP_HOST}
mkdir -p ${FTP_DIR}
mirror -c -R --loop /var/backups/borg ${FTP_DIR}
exit" > /backup/backup.lftp

if [ -n "${BORG_UID}" ]; then
    usermod -u ${BORG_UID} borg
fi

if [ -n "${BORG_GID}" ]; then
    groupmod -o -g ${BORG_GID} borg
    usermod -g ${BORG_GID} borg
fi

mkdir -p /root/.ssh
echo "${KNOWN_HOSTS}" > /root/.ssh/known_hosts
