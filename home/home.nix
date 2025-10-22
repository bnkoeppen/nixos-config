{ inputs, config, pkgs, ...}:

{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./hyprpaper.nix
  ];

  home.username = "bnk";
  home.homeDirectory = "/home/bnk";

  home.packages = with pkgs; [
    gimp
    grim
    slurp
    wofi # Required for hyprland
    alacritty # Required for hyprland terminal
    hyprpaper # Required for hyprland bg
    kdePackages.qtsvg
    kdePackages.dolphin # Required for hyprland files
    waybar
    font-awesome
    nerd-fonts.symbols-only
    pavucontrol
    brightnessctl
    discord
    swappy
    unzip
    vscodium.fhs
    inputs.cider.packages.x86_64-linux.cider-2
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
      nrebuild = "sudo nixos-rebuild switch --flake /etc/nixos";
      hlconf = "vim ~/.config/hypr/hyprland.conf";
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
  };
  
  home.stateVersion = "25.05";
}
