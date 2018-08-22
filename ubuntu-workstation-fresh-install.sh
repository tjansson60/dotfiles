#!/bin/sh

# Installation on workstation:
# * unetbootin
# * Setup anaconda enviroment
# * Setup printers
# * Setup rsnapshot (bohr)
# * Setup autofs to enable auto mount NFS on /net (bohr). Modify: /etc/auto.master
# * Setup fixed IPs in /etc/hosts with local network names

# Find out what programs that have manually been installed on a system (usufull when clean-installing at upgrade):
# comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

# Standard tools needed for install
sudo apt install autofs fonts-powerline fonts-roboto vim meld keepass2 filezilla gimp gimp-ufraw evince baobab htop\
    acidrip vlc calibre redshift-gtk darktable guake gkrellm nmap rsnapshot recordmydesktop x2goclient handbrake\
    iptraf sshfs bmon nethogs gparted build-essential fdupes flake8 git mediainfo pwgen\
    texlive-latex-extra texlive-latex-recommended texlive-lang-european ubuntu-restricted-extras nfs-common docker.io\
    pylint curl eog fonts-hack fonts-hack-ttf

# Download the google chrome deb and install
# Download DBeaver for SLQ work, or SQL operations for MSSQL

# VS code and SQL operations
sudo snap install --classic vscode
sudo snap install --classic slack
sudo snap install aws-cli  --classic

# Setup dockers
sudo gpasswd -a $USER docker
newgrp docker
sudo systemctl start docker
sudo systemctl enable docker
