#!/bin/bash
#Flightdeck Liftboat for WordPress - https://github.com/flight-deck/liftboat
echo "Starting DB backup. Please wait ..."
echo -e #new line

site_file_path="/THE-PATH-TO-YOUR-SITE-FILES"
backup_file_path="/WHERE-YOU-WANT-YOUR-FILES-TO-BE-STORED"


WPDBNAME=`cat $site_file_path/wp-config.php | grep DB_NAME | cut -d \' -f 4`
WPDBUSER=`cat $site_file_path/wp-config.php | grep DB_USER | cut -d \' -f 4`
WPDBPASS=`cat $site_file_path/wp-config.php | grep DB_PASSWORD | cut -d \' -f 4`


mysql_backup_file=$backup_file_path/"`date "+%Y-%m-%d"`".sql

mysqldump -u$WPDBUSER -p$WPDBPASS $WPDBNAME > $mysql_backup_file

echo -e
echo "DB backup done - $mysql_backup_file"

echo -e #new line

echo "Starting site backup. Please wait ..."
echo -e #new line

site_backup_file=$backup_file_path/"`date "+%Y-%m-%d"`".zip

zip -r $site_backup_file $site_file_path

echo -e
echo "Site backup is complete. - $site_backup_file"
echo -e
echo "Combine files. Please wait..."

full_backup_file=$backup_file_path/"`date "+%Y-%m-%d"`"-FULL.zip

zip -r $full_backup_file $site_backup_file $mysql_backup_file

echo -e
echo "Site files and db zipped. - $full_backup_file"
echo -e

rm -rf $site_backup_file $mysql_backup_file

echo -e
echo "Misc Clean up Complete."
echo -e
