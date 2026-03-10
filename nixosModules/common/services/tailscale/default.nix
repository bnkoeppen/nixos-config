{ config, ... }:
{
  services.tailscale = {
    enable = true;
    authKeyFile = config.sops.secrets.tailscaleKey.path;
  };

  services.resolved.enable = true; # Fixes weird DNS issues

}
