{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
    ];

    extraPackages = with pkgs; [
      nixd # nix
      nil # nix
    ];

    userSettings = {
      load_direnv = "direct";
    };
  };
}
