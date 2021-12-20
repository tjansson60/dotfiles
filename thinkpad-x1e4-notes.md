# Change the video modes 
sudo prime-select intel  # Good battery, but not functional HDMI
sudo prime-select nvidia  # Horrible battery, but good HDMI
sudo prime-select on-demand  # Good battery, somewhat working HDMI
sudo prime-select query

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
