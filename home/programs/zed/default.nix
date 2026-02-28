{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
  };
  
  programs.zed-editor-extensions = {
    enable = true;
    packages = with pkgs.zed-extensions; [
      nix
    ];
  };
}
