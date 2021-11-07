# sudo docker build -t onedrive-nextcloud-sync --build-arg pass='Nextcloud PASSWORD' --build-arg token='{Token (get with rclone authorize "onedrive")}' .

FROM ubuntu:20.04

LABEL version="0.1" 
LABEL name="OneDriveNextcloudSync"

RUN apt-get --fix-missing update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install apt-utils  
RUN apt-get -y install git rclone cron

ARG pass=''
ARG token=''
RUN rclone config create OneDriveSync onedrive config_refresh_token false token $token drive_id 'b!9R4DTOR14kmJsnkNNpGNAouGkz1tVkJIkAWK-dHN91IhQMPiFhKCTriiHPhpKzZ5' drive_type business
RUN rclone config create NextcloudSync webdav url https://www.gisijoalma.de/owncloud/remote.php/dav/files/jonas/ vendor "nextcloud" user "jonas" pass $pass

CMD rclone copy OneDriveSync:GoodNotes NextcloudSync:GoodNotes