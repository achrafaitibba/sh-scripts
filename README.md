# sh-scripts

to make the backup script automated:
1/ make it executable
chmod +x /path/to/your/backup_mysql.sh
2/set up the crone job
crontab -e
3/schedule it, 48H in my case
0 */48 * * * /path/to/your/backup_mysql.sh

