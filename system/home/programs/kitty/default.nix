{ pkgs, ... }:
{
  imports = [
    ./stylix.nix
  ];

  # iA Writer Mono V is broken specifically for kitty?
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans Mono";
    };
  };
}
