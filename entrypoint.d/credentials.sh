#!/bin/sh
echo "open -u ${FTP_USER},${FTP_PASSWORD} ${FTP_HOST}
mkdir -p ${FTP_DIR}
mirror -c -e -R /var/backups/borg ${FTP_DIR}
exit" > /backup/backup.lftp
