## Disable daemons on Debian

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