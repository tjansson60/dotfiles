## 2024-09-25

* Name `curie`. Replace: `kelvin`
* Debian server did not work out of the box with the Gigabyte Brix Extreme 2.5G network adapter, so I changed to Ubuntu
    server instead. 
* Changed `/etc/netplan/50-cloud-init.yaml` after install to change from DHCP to fixed IP after I setup and decided ont
    he layout.
* The 4 disk mdraid I migrated from `kelvin` to a USB gen 3.1 (Gen 2) IcyBox IB-3740-C31 disk enclosure that supported UASP (USB Attached SCSI Protocol) was automatically found by the installer and after install I mounted it as `/home` again and added it to the `/etc/fstab`
* Installed some locales `sudo apt intall language-pack-da` and `sudo locale-gen en_DK.UTF-8`
* Installed `unattended-upgrades`
    * Reviewed `/etc/apt/apt.conf.d/50unattended-upgrades`
    * Reviewed `/etc/apt/apt.conf.d/20auto-upgrades`
    * Checked status with `systemctl status unattended-upgrades`
* Copy over users from old system from the old `/etc/passwd`, `/etc/groups` and `/etc/shadow`
* Installed `samba` for fileshare with Windows workstation.
    * Remember `sudo systemctl start smbd nmbd` and `sudo systemctl enable smbd nmbd`
    * Create password for the needed migrated users: `sudo smbpasswd -a tjansson`
    * After updating `/etc/groups` and setting the rights on the share remember to restart `smbd`
* The user crontabs are stored in `/var/spool/cron/crontabs/`
    *

Roles:
* Run python code
* Run external off-site backups
* Run dropbox backup setup
* Run samba fileshare
* Run nextcloud
* Run munin or similar for monitoring.

ToDo:
- [x] Set up automatic updates
- [ ] Set up mail alerts
- [ ] Set up fail2ban or similar
