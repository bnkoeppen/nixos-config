{ ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraConfig = ''
      set relativenumber
      set list
    '';

    # Post 25.05 behaviors
    withRuby = false;
    withPython3 = true;
  };
}
