{ config, ... }:
{
  imports = [
    ./deps.nix
  ];

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        savePath = "${config.home.homeDirectory}/documents/images/screenshots";
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        saveAsFileExtension = ".png";
        showDesktopNotification = true;
        showAbortNotification = false;
        showHelp = true;
        showSidePanelButton = true;

        uiColor = "#740096";
        contrastUiColor = "#270032";
        drawColor = "#ff0000";

        useGrimAdapter = true;
        disabledGrimWarning = true;
      };
    };
  };
}
