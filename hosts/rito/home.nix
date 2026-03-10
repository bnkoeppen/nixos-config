{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
    ../../homeManagerModules
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

  home.stateVersion = "25.05";

}
