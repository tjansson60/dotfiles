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
# In vanilla ubuntu (gnome shell) the tool to install is gnome-tweaks and read:
# https://help.ubuntu.com/stable/ubuntu-help/tips-specialchars.html.en
# * Open the Activities overview and start typing Tweaks.
# * Click Tweaks to open the application.
# * Click the Keyboard & Mouse tab.
# * Click Disabled next to the Compose Key setting.
# * Turn the switch on in the dialog and pick the keyboard shortcut you want to use.
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

# Standard tools needed for install
sudo apt install autofs fonts-powerline fonts-roboto vim meld keepassxc gimp evince baobab htop\
    vlc redshift-gtk guake gkrellm nmap recordmydesktop \
    iptraf sshfs bmon nethogs gparted build-essential fdupes flake8 git pwgen\
    texlive-latex-extra texlive-latex-recommended texlive-lang-european ubuntu-restricted-extras nfs-common\
    pylint curl eog fonts-hack fonts-hack-ttf cmake exuberant-ctags ack-grep pep8 pyflakes3 isort build-essential\
    tilix cloudsql-proxy 

# Using tillix as a quake alternative - https://gnunn1.github.io/tilix-web/manual/quake/
# When you register the hot key, simply bind it to the following command: `tilix --quake`
# When Tilix is run with the --quake switch, it will check if a quake style window is already running and if so simply toggle the window’s visibility. If no quake style window has been created, then Tilix will create one and display it.
# Configuring this hot key for GNOME is quite simple, simply open the Keyboard settings and configure a hot key as per the example in the screenshot below:
sudo apt install  gnome-shell-extension-tilix-shortcut gnome-shell-extension-tilix-dropdown

# Mate i3 setup
# sudo apt install i3 diodon

# Gnome shell setup
# sudo apt-get install chrome-gnome-shell gnome-shell-extensions gnome-shell-extension-weather\
#     gnome-shell-extension-system-monitor gnome-shell-extension-multi-monitors gnome-shell-extension-caffeine\
#     gnome-tweaks gnome-shell-extension-impatience gnome-shell-extension-no-annoyance
# Install https://extensions.gnome.org/extension/28/gtile/ using firefox - tiling like fancyzones for windows, powertoys


# Local MySQL Database for testing
# $ sudo apt install mysql-server
# $ sudo mysql_secure_installation # This sets the password
# $ sudo mysql
# mysql> CREATE USER 'admin'@'localhost' IDENTIFIED BY '';
# mysql> GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;

# Install keybase
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd65.deb
run_keybase

# VS code and SQL operations
sudo snap install vscode --classic
sudo snap install slack --classic
sudo snap install kubectl --classic
sudo snap install aws-cli --classic
sudo snap install datagrip --classic
sudo snap install node --classic --edge  # Needed for jupyter

# Install the Google cloud sdk
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk

#########################################
# I3 - Use mate with an i3 window manager
# https://mattgreer.dev/blog/mate-and-i3/
# Use the dconf-editor. 
# * Change  org > mate > desktop > session > required-components. Change windowmanager from marco to i3.
# * Change  org > mate > desktop > session and in required-component-list, delete filemanager
#########################################
# dconf dump /org/mate/desktop/session/ > settings-mate-use-i3-as-wm.dconf
# dconf load /org/mate/desktop/session/ < settings-mate-use-i3-as-wm.dconf
# ln -s  ~/code/dotfiles/i3.config ~/.config/i3/config

# Tilix settings
# dconf dump /com/gexperts/Tilix/ > settings-tilix.dconf # Save
dconf load /com/gexperts/Tilix/ < settings-tilix.dconf # Load

# Guake settings
# dconf dump /apps/guake/ > settings-guake.dconf # Save
dconf load /apps/guake/ < settings-guake.dconf # Load

# Make clock settings (24-hour settings, week numbers etc)
# dconf dump /com/canonical/indicator/datetime/ > settings-indicator-datetime.dconf
dconf load /com/canonical/indicator/datetime/ < settings-indicator-datetime.dconf

# Make clock settings (24-hour settings, week numbers etc). After Mate 20.10
# dconf dump /org/ayatana/indicator/datetime/ > settings-indicator-datetime-ayatana.dconf
dconf load /org/ayatana/indicator/datetime/ < settings-indicator-datetime-ayatana.dconf

# Set up the background image
# dconf write  /org/mate/desktop/background/picture-filename "'/home/tjansson/code/dotfiles/background-traffic-in-denmark.png'"
# dconf dump /org/mate/desktop/background/ > settings-mate-desktop-background.dconf
dconf load /org/mate/desktop/background/ < settings-mate-desktop-background.dconf

# Make Gnome Shell start a interactive screenshot tool and not the annoying automatic save to home default
# dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > settings-gnome-screenshot.dconf
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < settings-gnome-screenshot.dconf 

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
