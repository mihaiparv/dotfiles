if ! grep -q "iso_layout=0" /etc/modprobe.d/hid_apple.conf; then
    echo "options hid_apple iso_layout=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
    
    # Regenerate initramfs so the kernel loads this setting on boot
    sudo mkinitcpio -P

    # Reload the kernel module without reboot
    sudo rmmod hid-apple && sudo modprobe hid-apple
fi