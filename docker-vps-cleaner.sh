#!/bin/bash

echo "  ____                              _____ _______   _____ ____  ____          "
echo " |  _ \            /\         /\   |_   _|__   __| |_   _|  _ \|  _ \   /\    "
echo " | |_) |_   _     /  \       /  \    | |    | |      | | | |_) | |_) | /  \   "
echo " |  _ <| | | |   / /\ \     / /\ \   | |    | |      | | |  _ <|  _ < / /\ \  "
echo " | |_) | |_| |  / ____ \ _ / ____ \ _| |_   | |     _| |_| |_) | |_) / ____ \ "
echo " |____/ \__, | /_/    \_(_)_/    \_\_____|  |_|    |_____|____/|____/_/    \_\\"
echo "         __/ |                                                                 "
echo "        |___/                                                                  "


echo VPS Cleaner Script by ACHRAF AIT IBBA hh
echo ......
echo .......
echo ........
echo .........
echo ..........
echo ...........
echo ............

echo This script will clean up Docker resources and system resources to free up memory and storage.

#to make sure the script is excuted with roor privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root hh"
  exit 1
fi

echo "Starting VPS cleanup..."

# Step 1: Remove all stopped containers
echo "Removing all stopped containers..."
docker container prune -f

# Step 2: Remove all unused images
echo "Removing all unused images..."
docker image prune -a -f

# Step 3: Remove all unused volumes
echo "Removing all unused volumes..."
docker volume prune -f

# Step 4: Remove all unused networks
echo "Removing all unused networks..."
docker network prune -f

# Step 5: Clean up dangling build cache
echo "Cleaning up dangling build cache..."
docker builder prune -f

# Step 6: Free up space by removing unnecessary packages
#echo "Removing unnecessary packages..."
#apt-get autoremove -y

# Step 7: Clean up the local repository of retrieved package files
#echo "Cleaning up local repository of retrieved package files..."
#apt-get clean

# Step 8: Remove old kernels
#echo "Removing old kernels..."
#dpkg -l | grep '^ii' | grep -E 'linux-image-[0-9]+' | grep -v `uname -r` | awk '{print $2}' | xargs apt-get -y purge

# Step 9: Remove orphaned packages
#echo "Removing orphaned packages..."
#deborphan | xargs apt-get -y remove --purge

# Step 10: Remove cached files and temporary files
echo "Cleaning cached and temporary files..."
rm -rf /var/cache/*
rm -rf /tmp/*

# Step 11: Sync file system changes to disk
echo "Syncing file system changes to disk..."
sync


# Step 12: Display disk usage after cleanup
echo "Disk usage after cleanup:"
df -h

echo "VPS cleanup completed. The table above shows the updated available system ressources "
echo "لا تنسونا من صالح الدعاء "
echo "By ACHRAF AIT IBBA"
echo "GITHUB: https://github.com/achrafaitibba"
echo "LinkedIn:  https://linkedin.com/in/achrafaitibba"
echo "Twitter:  https://x.com/achrafaitibba"
