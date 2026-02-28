{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./programs
    ./hyprland
  ];

  home.username = "bnk";
  home.homeDirectory = "/home/bnk";

  xdg.userDirs.enable = true;
  xdg.userDirs.documents = "${config.home.homeDirectory}/documents/xdg_documents";
  xdg.userDirs.download = "${config.home.homeDirectory}/downloads";

  home.packages = with pkgs; [
    grim
    slurp
    swappy
    hyprpaper # Required for hyprland bg
    kdePackages.qtsvg
    kdePackages.dolphin # Required for hyprland files
    waybar
    pavucontrol
    brightnessctl

    appimage-run
    fastfetch

    gimp
    discord
    inputs.cider.packages.x86_64-linux.cider-2
    keepassxc
    libreoffice
    obsidian
    readest
    vim

    python3
    racket
    go
    gcc
    fyne

    vintagestory
    azahar
  ];

  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 0.5
    '';
  };

  programs.fuzzel = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "bnkoeppen";
      email = "bnkoeppen@gmail.com";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ngc = "nix-store --gc";
      nrebuild = "sudo nixos-rebuild switch --flake /etc/nixos";
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
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  home.stateVersion = "25.11";
}
