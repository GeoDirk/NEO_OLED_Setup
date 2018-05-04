# NEO_OLED_Setup - Python3 version
Script and example for getting a SSD1306 OLED device working with a ConnectBox's Armbian Image

Usage from the command line:
```bash
wget https://github.com/GeoDirk/NEO_OLED_Setup/raw/master/install_oled.sh
chmod 755 install_oled.sh
./install_oled.sh
```

Ths script will install all the required libraries and set the ConnectBox image up for having a i2c device which is necessary for detecting the OLED panel. At the end of the installation, the script will reboot the NEO which will enable the i2c0 device in the Device Tree overlays.

After reboot, an example Python2 program that you can run in the /root folder. Run the example with the following command:

`python3 connectbox.py --i2c-port 0`

The OLED will intialize and display first the ConnectBox logo and then some text. End the demo with a CTRL-C on the keyboard.


