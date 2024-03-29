## 2024-01-09, WIFI issues

https://forums.lenovo.com/t5/ThinkPad-X-Series-Laptops/My-nightmare-with-X1-Extreme-%E2%80%93-Very-bad-wifi-signal-%E2%80%93-Bad-design/m-p/4444158?page=3#5226821

```bash
$ sudo dmidecode -s system-serial-number
R914MSED
```

```bash
$ sudo dmidecode -s bios-version
N40ET43W (1.25 )
```

Update to 1.26
https://pcsupport.lenovo.com/dk/da/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x1-extreme-4th-gen-type-20y5-20y6/20y5/20y5cto1ww/r914msed/downloads/ds551052-bios-update-utility-bootable-cd-for-windows-10-64-bit-and-linux-thinkpad-p1-gen-4-x1-extreme-gen-4?category=BIOS

> <N40UR23W>
>  UEFI: 1.26 / ECP: 1.18
> - [Important] Enhancement to address security vulnerability, CVE-2023-5058.
> - [Important] Enhancement to address security vulnerability, CVE-2023-23583.
> - (New) Updated the Diagnostics module to version 04.32.000.
> - (New) Updated the CPU microcode.
>     ¦   (Note) Above update will show "Self-Healing BIOS backup progressing ... xx %"
>     ¦   ¦   ¦  message on screen during BIOS update process.
> - (Fix) Updated some BIOS Setup help messages.
> - (Fix) Fixed an issue where Dock power button override is working during firmware update.
> - (Fix) Thermal improvement for FAN control.


## 2023-11-13, Nvidia problems

https://bugs.launchpad.net/ubuntu/+source/linux-nvidia/+bug/2016924

```
# [drm:nv_drm_master_set [nvidia_drm]] *ERROR* [nvidia-drm] [GPU ID 0x00000100] Failed to grab modeset
# [drm:nv_drm_master_set [nvidia_drm]] *ERROR* [nvidia-drm] [GPU ID 0x00000100] Failed to grab modeset
```

> Meshari E (idmbe) wrote on 2023-04-22:2023#1
> I did to fix this steps:

```
$ su
$ echo "blacklist i2c_nvidia_gpu" > /etc/modprobe.d/blacklist_i2c-nvidia-gpu.conf
$ sudo update-initramfs -u
```

## 2023-08-08, apt key problem

Problem
```
$ sudo apt update
Hit:1 http://mirror.one.com/ubuntu kinetic InRelease
Hit:2 http://mirror.one.com/ubuntu kinetic-updates InRelease
Hit:3 http://mirror.one.com/ubuntu kinetic-backports InRelease
Hit:4 http://mirror.one.com/ubuntu kinetic-security InRelease
Get:5 https://packages.cloud.google.com/apt cloud-sdk InRelease [6.361 B]
Err:5 https://packages.cloud.google.com/apt cloud-sdk InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY B53DC80D13EDEF05
  Reading package lists... Done
  Building dependency tree... Done
  Reading state information... Done
  All packages are up to date.
  W: An error occurred during the signature verification. The repository is not updated and the previous index files
  will be used. GPG error: https://packages.cloud.google.com/apt cloud-sdk InRelease: The following signatures couldn't
  be verified because the public key is not available: NO_PUBKEY B53DC80D13EDEF05
  W: Failed to fetch https://packages.cloud.google.com/apt/dists/cloud-sdk/InRelease  The following signatures couldn't
  be verified because the public key is not available: NO_PUBKEY B53DC80D13EDEF05
  W: Some index files failed to download. They have been ignored, or old ones used instead.
````

Solved with
```bash
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg
add -
```

## 2023-06-26, Remove Xubuntu

* `sudo update-alternatives --config default.plymouth`
* `sudo dpkg-reconfigure lightdm`
* `sudo apt remove xfce4-appfinder`

>>>>>>> Stashed changes

## 2023-02-22, boot compression

Changed `/etc/initramfs-tools/initramfs.conf` from `COMPRESS=zstd` to `COMPRESS=xz`

Then rebuild the images using
```
sudo update-initramfs -u -k all
```


## 2023-01-31, remove TLP

* After installing the mainline kernel 6.1.x everything seems more stable
* TLP does some strange things every now and again.
```
sudo apt remove tlp tlp-rdw tlpui
sudo apt install power-profiles-daemon
```

## 2023-01-10, TLP UI

```
sudo add-apt-repository ppa:linuxuprising/apps
sudo apt update
sudo apt install tlpui
```

## 2023-jan-02, External screen

It is possible to control the brightness of an external screen. First find the names of the screens:
```
> xrandr -q | grep " connected"
eDP-1 connected (normal left inverted right x axis y axis)
DP-1-0 connected primary 2560x1440+0+0 (normal left inverted right x axis y axis) 600mm x 340mm
```

Then set the brightness:
```
xrandr --output DP-1-0 --brightness 0.80
```

Alternatively install `gddccontrol` or `ddcutil` and the gnome extension called `Adjust Display Brightness`:
* https://extensions.gnome.org/extension/4652/adjust-display-brightness/

## 2022-dec-30, crashing

Installed kernel 6.0.9 using the mainline tool

```
sudo add-apt-repository ppa:cappelikan/ppa
sudo apt update
sudo apt install -y mainline
```

Working afterwards, but reinstalling the nvidia driver:
```
sudo apt reinstall nvidia-driver-525
```

## 2022-dec-28, TLP

> TLP will take care of the majority of settings that powertop --autotune would, and with less trial and error, see Powertop.

https://linrunner.de/tlp/installation/ubuntu.html

```bash
sudo add-apt-repository ppa:linrunner/tlp # TLP latest
# sudo add-apt-repository ppa:linuxuprising/apps # TLPUI latest
sudo apt update
sudo apt install tlp tlp-rdw
# sudo apt install tlpui
sudo apt remove power-profiles-daemon
sudo apt install acpi-call-dkms
```

# Change the video modes
* `sudo prime-select intel`  # Good battery, but not functional HDMI
* `sudo prime-select nvidia`  # Horrible battery, but good HDMI
* `sudo prime-select on-demand`  # Good battery, somewhat working HDMI
* `sudo prime-select query`

The best battery performance yet was archived by using the nouveau driver instead of the proprietary nvidia driver.

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

## Battery stats
`cat /sys/class/power_supply/BAT0/uevent`

# Automatically saving powertop suggestions

From https://wiki.archlinux.org/title/powertop

Save the following to the file `/etc/systemd/system/powertop.service`

```
[Unit]
Description=Powertop tunings

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/sbin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
```

# Enable a unit to start automatically at boot and start it immediately 
`systemctl enable --now powertop`
