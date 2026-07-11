{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.fastfetch.enable = true;
  programs.irssi.enable = true;
  programs.keepassxc.enable = true;
  programs.vim.enable = true;
  programs.zathura.enable = true;

  home.packages = with pkgs; [
    azahar
    gajim
    gimp
    libreoffice
    # musescore
    readest
    vintagestory
  ];
}
