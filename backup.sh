#!/usr/bin/env bash

set -e
set -x

DATETIME=`date +"%Y-%m-%d_%H_%M"`
FILE=$FILENAME-$DATETIME.sql.gz

mysqldump -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE | gzip -c  | aws s3 cp - s3://$BUCKET/$FILE
