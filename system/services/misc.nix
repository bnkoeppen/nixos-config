{
  services.blueman.enable = true; # Bluetooth manager
  services.libinput.enable = true; # Touchpad support
  services.thermald.enable = true; # Laptop thermals

  # Automatic media mounting
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
