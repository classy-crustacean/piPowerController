#!/bin/sh
if ! whoami | grep -iq 'root'
then
    echo "please run with sudo or as root"
    exit
fi

echo "Installing dependencies"
apt update -qy
apt install python3

echo "Copying files"

EXDIR=/usr/local/bin
mkdir -p $EXDIR

cp -f powerButton.py $EXDIR/powerButton.py
chmod 744 $EXDIR/powerButton.py

cp -f powerButton.service /etc/systemd/system/powerButton.service
chmod 644 /etc/systemd/system/powerButton.service

echo "Enabling power button service"

systemctl enable powerButton

echo "Restart pi to use power button"