#!/bin/bash

SCRIPT=$(realpath "$0")
SPATH=$(dirname "$SCRIPT")

THEME="z-bolt3.5"

TARGET=$HOME/KlipperScreen/styles

KLIPPERSCREENCONF=$HOME/printer_data/config/KlipperScreen.conf

sudo service KlipperScreen stop
mkdir -p $TARGET
rm -rf $TARGET/$THEME
cp -r $SPATH/$THEME "$TARGET/"
sudo cp $SPATH/$THEME/settings.ini /etc/gtk-3.0/

echo "!!! Experimental !!!"
echo "This installer will change $KLIPPERSCREENCONF"
echo "to enable this theme [z-bolt3.5] automatically"
read -p "Proceed (Y/N)? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  # 0 Create if not exist
  touch $KLIPPERSCREENCONF
  # 1. delete all previous theme selections
  sed -i '/theme =.*/d' $KLIPPERSCREENCONF
  # 2. Create [main] section if not exist
  grep "^\[main\]" $KLIPPERSCREENCONF || gawk -i inplace 'BEGINFILE{print"[main]"} 1' $KLIPPERSCREENCONF
  # 3. Append theme string after [main]
  sed -i "/^\[main\]/a\theme = z-bolt3.5" $KLIPPERSCREENCONF
fi

sudo service KlipperScreen start


