{ inputs, pkgs, ... }:
{
  programs.fastfetch.enable = true;
  programs.keepassxc.enable = true;
  programs.vim.enable = true;

  home.packages = with pkgs; [
    azahar
    gimp
    libreoffice
    musescore
    readest
    vintagestory

    inputs.cider.packages.x86_64-linux.cider-2
  ];
}
