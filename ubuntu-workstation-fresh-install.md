
## Installation

* Install Anaconda: https://www.anaconda.com/download
* Install keybase: https://keybase.io/download
* Install DBeaver: https://dbeaver.io/download
* Install Google Cloud SDK:
* Install ReMarkable: https://remarkableapp.github.io/linux/download.html

## DBEAVER not rendering text correctly
See, https://github.com/dbeaver/dbeaver/issues/3980. As a workaround use the following in the Mate launcher shorcut:
```
env GTK_IM_MODULE=ibus /usr/share/dbeaver/dbeaver -vmargs -Duser.timezone=UTC"
```

## Google cloud setup
Follow https://github.com/connectedcars/infrastructure/wiki/Google-Cloud-setup
```
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
sudo echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y
```
```
gcloud init
gcloud auth application-default login
```

Install Google Cloud SQL Proxy
```
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy
chmod +x cloud_sql_proxy
```

## HP Printer setup, install dependencies
Check if the HP printer has been setup correctly. Run `hp-check -r` and install the missing dependencies if needed. 

## US keyboard and compose key
In Ubuntu MATE, you can customise what key is the compose key by opening “Keyboard”, clicking “Layouts”, then “Options…”
and checking a box under “Position of compose key”. I checked “Right Alt”, meaning my “AltGr” key is now the compose
key. See:  https://help.ubuntu.com/community/GtkComposeTable

*  æ =` Shift-RightAlt ae`
*  ø = `Shift-RightAlt o/`
*  å = `Shift-RightAlt aa`
