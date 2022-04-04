#!/bin/bash
#Flightdeck Liftboat for WordPress
#https://github.com/flight-deck/liftboat-for-wordpress
echo "Starting DB backup. Please wait ..."
echo -e #new line

WPDBNAME=`cat /home/hco/webapps/usa/wp-config.php | grep DB_NAME | cut -d \' -f 4`
WPDBUSER=`cat /home/hco/webapps/usa/wp-config.php | grep DB_USER | cut -d \' -f 4`
WPDBPASS=`cat /home/hco/webapps/usa/wp-config.php | grep DB_PASSWORD | cut -d \' -f 4`

backup_path="/root/backups"

mysql_backup_file=$backup_path/"`date "+%Y-%m-%d"`"-usa.sql

mysqldump -u$WPDBUSER -p$WPDBPASS $WPDBNAME > $mysql_backup_file

echo -e
echo "DB backup done - $mysql_backup_file"

echo -e #new line

echo "Starting site backup. Please wait ..."
echo -e #new line

site_file_path="/home/hco/webapps/usa"
site_backup_file=$backup_path/"`date "+%Y-%m-%d"`"-usa.zip

zip -r $site_backup_file $site_file_path

echo -e
echo "Site backup is complete. - $site_backup_file"
echo -e
echo "Combine files. Please wait..."   

full_backup_file=$backup_path/"`date "+%Y-%m-%d"`"-FULL.zip

zip -r $full_backup_file $site_backup_file $mysql_backup_file

echo -e
echo "Site files and db zipped. - $full_backup_file"
echo -e

rm -rf $site_backup_file $mysql_backup_file

echo -e
echo "Misc Clean up Complete."
echo -e
