#!/bin/bash
echo "updating system to successfully install required packages"
sudo apt update
echo "installing required packages"
sudo apt install -y wget novnc websockify tigervnc-standalone-server tar openbox tilix
cd ~/
wget https://github.com/julian-alarcon/prospect-mail/releases/download/v1.3.13/outlook-for-linux-1.3.13.tar.gz && tar -xvf outlook-for-linux-1.3.13.tar.gz -C ~/ && sudo rm -rf outlook-for-linux-1.3.13.tar.gz && sudo mv -f ~/outlook-for-linux outlook
tigervncserver  -SecurityTypes none  --I-KNOW-THIS-IS-INSECURE  -xstartup /usr/bin/openbox -geometry 1366x768 -localhost no :0
websockify -D --web=/usr/share/novnc/  --cert=~/linux-novnc/novnc.pem 6080 localhost:5900
export DISPLAY=:0
outlook/outlook --in-process-gpu --display=:0
echo -e "Gmail Desktop and NoVNC has started go to https://localhost:6080 to access NoVNC and Gmail Desktop"
