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

  home.stateVersion = "25.11";

}
