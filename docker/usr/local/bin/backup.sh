#!/bin/bash
BUCKET=$1
BACKUP_DIR=$2
FILESTORE_DIR=$3
CONFIG=$4

mkdir -p $BACKUP_DIR
BACKUP_BASE=$(date +%Y%m%d%H%M%S).$(hostname -s)
BACKUP_FILESTORE_FILE=$BACKUP_BASE.filestore.tar.gz
cd $(dirname $FILESTORE_DIR)
tar cfz $BACKUP_DIR/$BACKUP_FILESTORE_FILE $(basename $FILESTORE_DIR)

BACKUP_DB_FILE=$BACKUP_BASE.db.sql.gz
$(/usr/bin/php <<EOF
<?php
include "$CONFIG";
echo "mysqldump --single-transaction -h \$mysql_server -u \$mysql_username -p\$mysql_password \$mysql_db";
EOF
) | gzip > $BACKUP_DIR/$BACKUP_DB_FILE

for FILE in $BACKUP_FILESTORE_FILE $BACKUP_DB_FILE;do
  aws s3 cp --storage-class STANDARD_IA $BACKUP_DIR/$FILE s3://$BUCKET/resourcespace/
  rm $BACKUP_DIR/$FILE
done
