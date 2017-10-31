#!/bin/bash

cd ~
echo " "
echo "Checking for apt locks"
## check if DPKG database is locked
dpkg -i /dev/zero 2>/dev/null
if [ "$?" -eq 2 ]; then
    echo "dpkg database is locked by a system upgrade. Try again later..."
	exit 0
fi

apt-get install python-dev python-pip libfreetype6-dev libjpeg-dev build-essential i2c-tools -y
sudo -H pip install --upgrade pip
apt-get purge python-pip -y
sudo -H pip install --upgrade pip setuptools
#problems with installing the next command with pillow
sudo -H pip install --upgrade luma.oled
git clone https://github.com/rm-hull/luma.examples.git

#add in I2C overlay
sed -i '/overlays=usbhost0 usbhost1 usbhost2 usbhost3/c\overlays=usbhost0 usbhost1 usbhost2 usbhost3 i2c0' /boot/armbianEnv.txt

#i2cdetect -y 0
#cd ~/luma.examples/examples/
#python font_awesome.py --i2c-port 0

echo " "
echo "Please restart to implement changes!"
echo "  _____  ______  _____ _______       _____ _______ "
echo " |  __ \|  ____|/ ____|__   __|/\   |  __ \__   __|"
echo " | |__) | |__  | (___    | |  /  \  | |__) | | |   "
echo " |  _  /|  __|  \___ \   | | / /\ \ |  _  /  | |   "
echo " | | \ \| |____ ____) |  | |/ ____ \| | \ \  | |   "
echo " |_|  \_\______|_____/   |_/_/    \_\_|  \_\ |_|   "
echo " "
echo "Please restart to implement changes!"
echo "To Restart type sudo reboot"

echo "To finish changes, we will reboot the NEO."
echo "Pi must reboot for changes and updates to take effect."
echo "If you need to abort the reboot, press Ctrl+C.  Otherwise, reboot!"
echo "Rebooting in 5 seconds!"
sleep 1
echo "Rebooting in 4 seconds!"
sleep 1
echo "Rebooting in 3 seconds!"
sleep 1
echo "Rebooting in 2 seconds!"
sleep 1
echo "Rebooting in 1 seconds!"
sleep 1
echo "Rebooting now!  "
sleep 1
sudo reboot