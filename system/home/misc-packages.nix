{ pkgs, ... }:
{
  home.packages = with pkgs; [
    appimage-run

    python3
    racket
  ];
}
