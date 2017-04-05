#!/usr/bin/env bash

set -x

DATETIME=`date +"%Y-%m-%d_%H_%M"`
FILE=$S3_FILENAME-$DATETIME.sql.gz

mysqldump -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE | gzip -c  | aws s3 cp - s3://$S3_BUCKET/$FILE
