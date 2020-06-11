#!/bin/sh

# ## Installation
# 
# * Install Anaconda: https://www.anaconda.com/download
# * Install ReMarkable: https://remarkableapp.github.io/linux/download.html
# 
# ## CC Google cloud setup
# Follow https://github.com/connectedcars/infrastructure/wiki/Google-Cloud-setup
# 
# ## HP Printer setup, install dependencies
# Check if the HP printer has been setup correctly. Run `hp-check -r` and install the missing dependencies if needed. 
# 
# ## US keyboard and compose key
# In Ubuntu MATE, you can customise what key is the compose key by opening “Keyboard”, clicking “Layouts”, then “Options…”
# and checking a box under “Position of compose key”. I checked “Right Alt”, meaning my “AltGr” key is now the compose
# key. See:  https://help.ubuntu.com/community/GtkComposeTable
# 
# *  æ =` Shift-RightAlt ae`
# *  ø = `Shift-RightAlt o/`
# *  å = `Shift-RightAlt aa`

# Installation on workstation:
# * unetbootin
# * Setup anaconda enviroment
# * Setup printers
# * Setup rsnapshot (bohr)
# * Setup autofs to enable auto mount NFS on /net (bohr). Modify: /etc/auto.master
# * Setup fixed IPs in /etc/hosts with local network names

# Find out what programs that have manually been installed on a system (usufull when clean-installing at upgrade):
# comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

# Tilix settings
# dconf dump /com/gexperts/Tilix/ > tilix.dconf   # Save
# dconf load /com/gexperts/Tilix/ < tilix.dconf   # Load

# Guake settings
# dconf dump /apps/guake/ > guake.dconf # Save
# dconf load /apps/guake/ < guake.dconf # Load

# Standard tools needed for install 
sudo apt install autofs fonts-powerline fonts-roboto vim meld keepassxc gimp evince baobab htop\
    vlc redshift-gtk guake gkrellm nmap recordmydesktop \
    iptraf sshfs bmon nethogs gparted build-essential fdupes flake8 git pwgen\
    texlive-latex-extra texlive-latex-recommended texlive-lang-european ubuntu-restricted-extras nfs-common\
    pylint curl eog fonts-hack fonts-hack-ttf cmake exuberant-ctags ack-grep pep8 pyflakes isort build-essential\
    tilix cloudsql-proxy

# Install keybase
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb
run_keybase

# VS code and SQL operations
sudo snap install vscode --classic
sudo snap install slack --classic
sudo snap install aws-cli --classic
sudo snap install datagrip --classic

# Install the Google cloud sdk
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk

# Extra media
# sudo apt install gimp-ufraw acidrip calibre darktablehandbrake mediainfo 

# Extra tools
# sudo apt install spshotredshift-gtk filezilla x2goclient

# Yubikey inside a VirtualBox
# https://bjgill.net/2018/02/05/usb-mapping/

# Thinkpad power management
# sudo add-apt-repository ppa:linrunner/tlp
# sudo apt-get update
# sudo apt-get install tlp tlp-rdw tp-smapi-dkms acpi-call-dkms smartmontools

# Download DBeaver for SLQ work, or SQL operations for MSSQL. Prefering datagrip
# DBEAVER not rendering text correctly See, https://github.com/dbeaver/dbeaver/issues/3980. As a workaround use the following in the Mate launcher shorcut:
# ```
# env GTK_IM_MODULE=ibus /usr/share/dbeaver/dbeaver -vmargs -Duser.timezone=UTC"
# ```
# sudo add-apt-repository ppa:serge-rider/dbeaver-ce
# sudo add-apt-repository ppa:jonathonf/vim-daily # Latests vim versions
# sudo apt-get update
# sudo apt install dbeaver-ce

# Extra docker
# sudo apt install spshotredshift-gtk filezilla x2goclient
# Setup dockers
# sudo gpasswd -a $USER docker
# newgrp docker
# sudo systemctl start docker
# sudo systemctl enable docker
