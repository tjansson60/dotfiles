# Backup setup

Local server: Debian RAID-5 setup with 4 data disks

1. Daily incremental off-site backup from server to external server
2. Monthly incremental backup from server to external off-line disk using rsnapshot
3. Daily backup of files from Virtual machine to server backup folder (then included in 1 and 2)
4. Daily backup of Windows files to server backup folder (then included in 1 and 2) 
5. Phone images - Dropbox sync and syncthing sync to server (then included in 1 and 2)  

## Rsnapshot
* Monthly backup of website through SSH
* Monthly backup of server to external disk

## Syncthing

* Main instance running on server
* Client running on phones syncing images to server

## Dropbox

* Running as a service on server
* Phones syncing images to server
* Manual clean-up to phone-pictures folder when full

Notes on moving folder: http://web.archive.org/web/20180705015441/http://www.dropboxwiki.com/tips-and-tricks/install-dropbox-in-an-entirely-text-based-linux-environment
