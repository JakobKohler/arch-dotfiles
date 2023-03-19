rmmod btusb
modprobe btusb
echo "Reloaded Bluetooth Kernel Module"
rfkill block bluetooth
rfkill unblock bluetooth
echo "Unblocked bluetooth from rfkill"
systemctl stop bluetooth
systemctl start bluetooth
echo "Restarted bluetooth.service"
