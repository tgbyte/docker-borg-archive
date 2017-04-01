#!/bin/sh
echo "open -u ${FTP_USER},${FTP_PASSWORD} ${FTP_HOST}
mkdir -p ${FTP_DIR}
mirror -c -R --loop /var/backups/borg ${FTP_DIR}
exit" > /backup/backup.lftp

mkdir -p /root/.ssh
echo "${KNOWN_HOSTS}" > /root/.ssh/known_hosts
