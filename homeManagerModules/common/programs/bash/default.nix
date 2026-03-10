{ config, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ngc = "nix-store --gc";
      nrebuild = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/repos/nixos-config";
    };
  };
}
