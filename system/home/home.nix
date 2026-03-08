{ inputs, config, ... }:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
    ./misc-packages.nix

    ./programs
    ./hyprland
    ./services
  ];

  home.username = "bnk";
  home.homeDirectory = "/home/bnk";

  xdg.userDirs.enable = true;
  xdg.userDirs.documents = "${config.home.homeDirectory}/documents/xdg_documents";
  xdg.userDirs.download = "${config.home.homeDirectory}/downloads";

  home.stateVersion = "25.05";

}
