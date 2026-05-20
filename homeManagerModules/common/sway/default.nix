{ lib, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "Mod4";
      terminal = "foot";

      startup = [
        { command = "firefox"; }
      ];

      output = {
        eDP-1 = {
          scale = "1.25";
        };
      };

      window.titlebar = false;

      keybindings = lib.attrsets.mergeAttrsList [
        (lib.attrsets.mergeAttrsList (
          map
            (
              num:
              let
                ws = toString num;
              in
              {
                "${modifier}+${ws}" = "workspace ${ws}";
                "${modifier}+Shift+${ws}" = "move container to workspace ${ws}";
              }
            )
            [
              1
              2
              3
              4
              5
              6
              7
              8
              9
              0
            ]
        ))
        (lib.attrsets.concatMapAttrs
          (key: direction: {
            "${modifier}+${key}" = "focus ${direction}";
            "${modifier}+Ctrl+${key}" = "move ${direction}";
          })
          {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
          }
        )
        {
          "${modifier}+q" = "exec --no-startup-id ${terminal}";
          "${modifier}+space" = "exec --no-startup-id fuzzel";

          "${modifier}+c" = "kill";

          "${modifier}+f" = "fullscreen toggle";
          "${modifier}+g" = "split h";
          "${modifier}+v" = "split v";

          "${modifier}+Shift+r" = "exec swaymsg reload";
          "${modifier}+Ctrl+l" = "exec ${pkgs.swaylock-fancy}/bin/swaylock-fancy";
          "${modifier}+Shift+e" = "exit";
        }
      ];
    };
  };
}
