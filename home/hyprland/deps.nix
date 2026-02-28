{ pkgs, ... }:
{
  home.pkgs = with pkgs; [
    kdePackages.dolphin
    pavucontrol
    brightnessctl
  ];
}
