{ pkgs, ... }:
{
  imports = [
    ./deps.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
    fonts = {
      sansSerif = {
        package = pkgs.ia-writer-quattro;
        name = "iA Writer Quattro S";
      };
      monospace = {
        package = pkgs.ia-writer-mono;
        name = "iA Writer Mono V";
      };
    };
  };
}
