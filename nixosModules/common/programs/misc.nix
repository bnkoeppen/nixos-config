{ pkgs, ... }:
{
  programs.nix-ld.enable = true; # Required for zed

  programs.nix-ld.libraries = with pkgs; [
    fontconfig
    libxcursor
    libxinerama
    libxext
    libxrandr
    libxrender
    libx11
    libxi
    libxt
    libxtst
    libxft
    libGL
    libpulseaudio
  ];

  programs.firefox.enable = true;
  programs.steam.enable = true;
}
