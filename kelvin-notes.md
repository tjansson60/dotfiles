## Disable daemons on Debian

## 2022-jun-12

Removed `syncthing` and `openipmi`. Not used and causing wakeups

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
