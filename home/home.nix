{
  config,
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

  home.stateVersion = "25.11";

}
