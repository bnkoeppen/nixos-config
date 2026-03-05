{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "quarto"
    ];

    extraPackages = with pkgs; [
      nixd # nix
      nil # nix
    ];

    userSettings = {
      load_direnv = "shell_hook";
    };
  };
}
