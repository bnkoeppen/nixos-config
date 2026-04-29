{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
    ../../homeManagerModules
    ../../homeManagerModules/zora
  ];

  home.username = "bnk";
  home.homeDirectory = "/home/bnk";

  xdg = {
    userDirs = {
      enable = true;
      documents = "${config.home.homeDirectory}/documents/xdg_documents";
      download = "${config.home.homeDirectory}/downloads";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  home.stateVersion = "25.05";

  # Post 25.05 defaults changes
  gtk.gtk4.theme = null;
  programs.yazi.shellWrapperName = "y";
  xdg.userDirs.setSessionVariables = false;

}
