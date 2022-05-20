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
