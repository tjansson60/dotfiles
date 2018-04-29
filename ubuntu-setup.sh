#!/bin/sh

# Installation on workstation: 
# * unetbootin 
# * Setup anaconda enviroment
# * Setup printers 
# * Setup rsnapshot (bohr)
# * Setup autofs for NFS mount (bohr)

# Find out what programs that have manually been installed on a system (usufull when clean-installing at upgrade):
# comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

# Standard tools needed for install 
sudo apt install autofs fonts-powerline fonts-roboto vim meld keepass2 filezilla gimp gimp-ufraw evince baobab htop\
    acidrip vlc calibre redshift darktable guake gkrellm nmap rsnapshot pdftk recordmydesktop x2goclient handbrake\
    iptraf sshfs bmon nethogs google-chrome-stable gparted build-essential fdupes flake8 git mediainfo pwgen\
    texlive-latex-extra texlive-latex-recommended ubuntu-restricted-extras 

# VS code and SQL operations
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install sqlops code 
