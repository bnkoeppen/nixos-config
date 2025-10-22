{ config, pkgs, ... }:

{
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    preload = "/home/bnk/gimp_projects/desktop_bg.png";
    wallpaper = ", /home/bnk/gimp_projects/desktop_bg.png";
  };
}
