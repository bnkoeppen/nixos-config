{
  services.tlp = {
    enable = true;
    settings = {
      # Workaround so laptop has fan spin while on wall power
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERISTENT_DEFAULT = 1;
    };
  };
}
