{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    brightnessctl
  ];
}
