{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      corefonts
      font-awesome
      nerd-fonts.symbols-only
      ia-writer-quattro
      ia-writer-mono
    ];
  };
}
