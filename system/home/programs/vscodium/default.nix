{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = import ./extensions.nix { inherit pkgs; };
  };
}
