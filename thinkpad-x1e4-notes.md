# Change the video modes 
* `sudo prime-select intel`  # Good battery, but not functional HDMI
* `sudo prime-select nvidia`  # Horrible battery, but good HDMI
* `sudo prime-select on-demand`  # Good battery, somewhat working HDMI
* `sudo prime-select query`


The best battery performance yet was archived by using the nouveau driver instead of the proprietary nvidia driver.

## Battery stats
`cat /sys/class/power_supply/BAT0/uevent` 

# Lid suspends the laptop
https://fostips.com/lid-close-action-ubuntu-21-04-laptop/

Edit and uncomment `/etc/systemd/logind.conf`:

* `#HandleLidSwitchDocked=ignore` – If your system is inserted in a docking station, or if more than one display is
connected, then the action occurs if specified.
* `#HandleLidSwitchExternalPower=suspend` – If your system is on external power, the action occurs if specified.
* `#HandleLidSwitch=suspend` – For all other cases, the value of HandleLidSwitch will occur if enabled.

Afterward restart
```
sudo systemctl restart systemd-logind.service
```

# Powertop suggested recommendation
```
sudo apt-get remove irqbalance
```
http://konkor.github.io/cpufreq/faq/

# Brightness control
https://askubuntu.com/questions/1368075/screen-brightness-issues-on-lenovo-legion-5-pro-2021-ubuntu-20-04

If your BIOS is set to dynamic/hybrid mode
Edit grub’s config:
```
sudo vim /etc/default/grub
```

Change the line:
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```
To:
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video.use_native_backlight=1"
```
Then run:
```
sudo update-grub
```
And restart the laptop.
