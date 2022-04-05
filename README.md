# Flightdeck - LifeBoat for WordPress

Just a simple Bash script to provide a small level of support to your WordPress site, by backing up all WordPress files and database.

### Purpose
The main purpose of this script is to a small level of devops or network administration to WordPress without having the need to install plugins.
In our experience, most of the backup solutions for WordPress add unnecessary bloat with slow performance – especially on larger sites.


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
5. Optional: Automate the process with a cron job.
  ```shell
  crontab -e
  ```

  ```shell
  MAILTO="webmaster@YOUR-DOMAIN.com"
  0 0 */10 * * /home/<YOUR-USERNAME>/lifeboat.sh
  #👆 Runs on every 10th day-of-month at midnight.
  ```


