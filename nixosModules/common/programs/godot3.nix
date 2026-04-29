{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    godot3
    godot3-export-templates
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libxcursor
    libxinerama
    libxext
    libxrandr
    libxrender
    libx11
    libxi
    libGL
    libpulseaudio
  ];
}
