{ ... }:
{
  # This fixes a bug in stylix's discord module wrt fonts
  stylix.targets.nixcord.extraCss = ''
    :root {
      --font: iA Writer Quattro S;
    }
  '';
}
