{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    pavucontrol
    playerctl
  ];
}
