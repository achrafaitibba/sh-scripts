#!/bin/bash

# Define the backup directory
BACKUP_DIR="/home/jitpilot/backup"
CONTAINER_NAME="JitPilot-db"
MYSQL_USER="root"
MYSQL_PASSWORD="password"
MYSQL_DATABASE="jitpilot_db"

# Create backup file name with date and time
BACKUP_FILE="backup-$(date +'%Y-%m-%d-%H-%M').sql"

# Run the Docker command to create a backup
docker exec $CONTAINER_NAME /usr/bin/mysqldump -u $MYSQL_USER --password=$MYSQL_PASSWORD $MYSQL_DATABASE > $BACKUP_DIR/$BACKUP_FILE

# Optional: Remove old backups (e.g., older than 7 days)
find $BACKUP_DIR -type f -name "*.sql" -mtime +7 -exec rm {} \;
