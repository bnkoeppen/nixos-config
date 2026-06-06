{ pkgs, ... }:
{
  programs.prismlauncher = {
    enable = true;

    package = pkgs.prismlauncher.override (old: {
      jdks = (
        if old ? jdks then
          old.jdks
        else
          [
            pkgs.temurin-bin-8
            pkgs.temurin-bin-17
            pkgs.temurin-bin-21
          ]
      );
    });
  };
}
