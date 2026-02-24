{ config, pkgs, ... }:

{
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    preload = "/home/bnk/documents/images/backgrounds/abstract_1_16by10.png";
    wallpaper = ", /home/bnk/documents/images/backgrounds/abstract_1_16by10.png";
  };
}
