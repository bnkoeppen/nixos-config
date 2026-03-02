{ ... }:
{
  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;

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
