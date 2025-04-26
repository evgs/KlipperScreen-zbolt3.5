#!/bin/bash

SCRIPT=$(realpath "$0")
SPATH=$(dirname "$SCRIPT")

THEME="z-bolt3.5"

TARGET=$HOME/KlipperScreen/styles

sudo service KlipperScreen stop
mkdir -p $TARGET
rm -rf $TARGET/$THEME
cp -r $SPATH/$THEME "$TARGET/"
sudo cp $SPATH/$THEME/settings.ini /etc/gtk-3.0/

sed -i '/theme =.*/d' ~/printer_data/config/KlipperScreen.conf
cat $SPATH/KlipperScreen.conf.theme_snippet ~/printer_data/config/KlipperScreen.conf > /tmp/KlipperScreen.conf
mv /tmp/KlipperScreen.conf ~/printer_data/config


sudo service KlipperScreen start


