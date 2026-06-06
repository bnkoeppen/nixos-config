{ pkgs, ... }:
{
  home.packages = with pkgs; [
    eden
  ];
}
