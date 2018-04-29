#!/bin/sh

# Installation on workstation: 
# * unetbootin 
# * Setup anaconda enviroment
# * Setup printers 
# * Setup rsnapshot (bohr)
# * Setup autofs for NFS mount (bohr)

# Standard tools needed for install 
sudo apt install autofs fonts-powerline fonts-roboto vim meld keepass2 filezilla gimp gimp-ufraw evince baobab htop\
    acidrip vlc calibre redshift darktable guake gkrellm nmap rsnapshot pdftk recordmydesktop x2goclient handbrake\
    iptraf sshfs bmon nethogs google-chrome-stable gparted

# VS code and SQL operations
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install sqlops code 
