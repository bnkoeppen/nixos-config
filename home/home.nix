{ inputs, config, pkgs, ...}:

let
  R-studio-custom = pkgs.rstudioWrapper.override{ packages = with pkgs.rPackages; [ ggplot2 knitr rmarkdown lubridate tidyverse zoo tinytex ]; };
in
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./hyprpaper.nix
  ];

  home.username = "bnk";
  home.homeDirectory = "/home/bnk";
  home.packages = with pkgs; [
    grim
    slurp
    swappy
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
    unzip
    corefonts
    appimage-run
    python3Full

    gimp
    discord
    inputs.cider.packages.x86_64-linux.cider-2
    keepassxc
    libreoffice
    zathura
    musescore
    R-studio-custom
    
    vscodium.fhs 
    jetbrains.rider
    cmake
    gcc
    clang-tools
    gnumake
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

  programs.obs-studio = {
    enable = true;

    # optional Nvidia hardware acceleration
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi #optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  programs.yazi = {
    enable = true;
  };
  
  home.stateVersion = "25.05";
}
