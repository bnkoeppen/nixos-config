{ ... }:
{
  imports = [
    ./stylix.nix
  ];

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    discord.krisp.enable = true;

    config = {
      frameless = true;
      transparent = true;

      plugins = {
        ignoreActivities = {
          enable = true;
        };
      };
    };
  };
}
