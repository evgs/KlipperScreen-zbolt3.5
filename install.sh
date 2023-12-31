#!/bin/bash

SCRIPT=$(realpath "$0")
SPATH=$(dirname "$SCRIPT")

THEME="z-bolt3.5"

TARGET=$HOME/KlipperScreen/styles

sudo service KlipperScreen stop
rm -rf $TARGET/$THEME
cp -r $SPATH/$THEME "$TARGET/"
sudo cp $SPATH/$THEME/settings.ini /etc/gtk-3.0/

sudo service KlipperScreen start

echo "Please select $THEME : More>KlipperScreen>Icon Theme"
