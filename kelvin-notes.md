# Kelvin notes

## 2022-oct-21, home-assistant

After reinstalling docker using https://docs.docker.com/engine/install/debian/
`docker system prune -af` was needed to clean up old images. 

https://www.home-assistant.io/installation/linux
```bash
docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=Europe/Copenhagen \
  -v /etc/home-assistant:/config \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable
```
Access: http://192.168.0.160:8123/

Setup: HACS with https://hacs.xyz/docs/setup/download for container


## 2022-jul-29, more apt issues

The problem seems to be libsvtav1enc0

```
sudo apt remove libsvtav1enc0 libavif14 libavif-dev  libgd-dev
```

## 2022-jul-9


More apt issues removed more unused packages

```
 sudo apt remove libfreerdp2-2 libfreerdp-client2-2 libfreerdp-server2-2  gnome-remote-desktop  gnome-control-center
 libavcodec59
```

## 2022-jul-7

Problems with apt, uninstalled unneeded libs. Fixed with as `sudo dpkg --configure -a`, `sudo apt-get install -f` didn't
work

```
sudo dpkg --remove --force-remove-reinstreq libavcodec59 libavformat59 libgegl-0.4-0 gimp libgimp2.0 xsane
libchromaprint-tools picard
```

Also saw this message, will monitor
```
plexmediaserver was not running
/root/restart-plex.sh: line 7: service: command not found
```


## 2022-jun-17
Disabled powertop auto application again. Did make a difference and munin revealed higher utilization

## 2022-jun-12

* Removed `syncthing` and `openipmi`. Not used and causing wakeups
* Applied `power-saveing.md` auto powertop application
* Removed `preload`

### 2022-may-30, netdata
Disabled netdata alltogether as it is waking the server and is not used.
```
sudo service netdata stop # Kill it now
sudo systemctl disable netdata # Stop from running at boot
```

### 2022-may-30, x2goserver
Disabled netdata spamming apache acces_log:
```
sudo /etc/netdata/edit-config python.d/apache.conf
```
Commented out all the logging. Munin monitoring is enough

### 2022-may-30, x2goserver
Not used anymore.
```bash
sudo service x2goserver stop # Kill it now
sudo systemctl disable x2goserver # Stop from running at boot
```

### 2022-may-30, avahi-daemon
Was taking up way to much CPU and not used
```bash
sudo service avahi-daemon stop # Kill it now
sudo systemctl disable avahi-daemon # Stop from running at boot
```

### 2022-may-30, gkrellmd
I am not using it anymore and have disabled it:
```bash
sudo service gkrellmd stop # Kill it now
sudo systemctl disable gkrellmd # Stop from running at boot
```
