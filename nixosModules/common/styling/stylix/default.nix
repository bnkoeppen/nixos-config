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

      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
    };

    opacity = {
      applications = 0.5;
      desktop = 0.5;
      popups = 0.8;
      terminal = 1.0;
    };

  };
}
