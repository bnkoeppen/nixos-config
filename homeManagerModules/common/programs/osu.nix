{ pkgs, ... }:
{
  home.packages = with pkgs; [
    osu-osu-lazer-bin
  ];
}
