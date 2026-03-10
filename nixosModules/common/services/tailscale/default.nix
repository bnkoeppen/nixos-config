{ config, ... }:
{
  services.tailscale = {
    enable = false;
    authKeyFile = config.sops.secrets.tailscaleKey.path;
  };
}
