# Flightdeck LifeBoat for WordPress

This is just a simple Bash script to provide a small level of support to your WordPress site, by backing up all WordPress files and database.

### Usages
To use this script follow the below steps:

1. Update `lifeboat.sh` by editing the two variables below:
  - `site_file_path`: set this to your source (ie: your WordPress root)
  - `backup_file_path`: set this to your destination (where you want to store the backups)

2. Upload `lifeboat.sh` to your server:
  ```shell
  scp lifeboat.sh root@192.168.1.1:/home/<YOUR-USERNAME>/scripts
  ```
3. Update permissions
  ```shell
  cd /home/<YOUR-USERNAME>/scripts
  chmod 760 scripts/lifeboat.sh
  ```
4. Run the script
  ```shell
  ./lifeboat.sh
  ```
5. Automate the process with a cron job.
  ```shell
  crontab -e
  MAILTO="webmaster@YOUR-DOMAIN.com"
  0 0 */10 * * /home/<YOUR-USERNAME>/lifeboat.sh
  #👆 Runs on every 10th day-of-month at midnight.
  ```

