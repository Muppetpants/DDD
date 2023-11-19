# DDD
Requirements:
2x Devices (RPi) 
- One serves as the receiver
- The other as the AP/Server

On Receiving device:
```bash
# Set-up wpa_supplicant.conf with AP settings
sudo mv /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf.bak
sudo sh -c "wpa_passphrse '<SSID>' '<passphrase>' > /etc/wpa_supplicant/wpa_supplicant.conf"
```
```bash
# Purge previous Network Manager connections
sudo rm /etc/NetworkManager/system-connections
```
```bash
# Run wpa_supplicant
sudo wpa_supplicant -B -i <adapter> -c /etc/wpa_supplicant/wpa_supplicant.conf
```




TBD...
1. On receiving device: Run wpa_passphrase command to set up the wpa_supplicant.conf file in /etc/wpa_supplicant/wpa_supplicant.conf
2. On receiving device: Check /etc/NetworkManager/system-connections and delete all files named after any incorrect wifi networks
3. On receiving device: Run wpa_supplicant command to connect to AP
4. On receiving device: Double-check your wpa_supplicant.conf file to be sure it does not have any other APs configured 
5. Put script digitalDD.sh on the AP and note the path
6. Alter digitalDD.sh script to match the path of wirelssDD.sh for all commands and desired dropoff location of message.txt on receiving device
In digitalDD.sh script, replace MAC address with the MAC of your receiving device
7. Alter crontab on AP to match digitalDD.sh location and run every minute 

Note: Test before use. You must confirm that your receiving device automatically connects to the wireless AP device for this to work.
