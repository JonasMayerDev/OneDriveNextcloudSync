# OneDrive-Nextcloud-Sync
Just a simple Docker Container that syncs the Goodnotes Folder in a OneDrive (eg. from saving Goodnotes Notes from the App) to a Goodnotes Folder in the Nextcloud to Backup.

```bash 
# To Build, just run this command from the root dir:
sudo docker build -t onedrive-nextcloud-sync --build-arg pass='Nextcloud PASSWORD' --build-arg token='{Token (get with rclone authorize "onedrive")}' --build-arg drive_id='OneDrive ID' .
```
