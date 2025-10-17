{ config, pkgs, ...}:

{
  imports = [
    ./hyprland.nix
  ];

  home.username = "bnk";
  home.homeDirectory = "/home/bnk";

  home.packages = with pkgs; [
    gimp
    grim
    slurp
    alacritty # Required for hyprland terminal
    hyprpaper # Required for hyprland bg
    kdePackages.qtsvg
    kdePackages.dolphin # Required for hyprland files
  ];

  programs.git = {
    enable = true;
    userName = "bnkoeppen";
    userEmail = "bnkoeppen@gmail.com";
  };
  
  programs.bash = {
    enable = true;
    enableCompletion = true;
    
    shellAliases = {
      la = "ls -la";
      nconf = "sudo vim /etc/nixos/configuration.nix";
      ngc = "nix-store --gc";
      nrebuild = "sudo nixos-rebuild switch --flake .";
      hlconf = "vim ~/.config/hypr/hyprland.conf";
    };
  };
  
  home.stateVersion = "25.05";
}
