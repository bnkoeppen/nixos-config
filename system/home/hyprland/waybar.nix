{ ... }:
{
  programs.waybar.enable = true;

  programs.waybar.settings = {
    main-bar = {
      layer = "top";
      position = "top";
      spacing = 0;

      modules-left = [
        "hyprland/workspaces"
      ];

      modules-center = [
        "hyprland/window"
      ];

      modules-right = [
        "network"
        "pulseaudio"
        "backlight"
        "battery"
        "clock"
        "tray"
      ];

      network = {
        format-wifi = "";
        tooltip-format = "";
        format-linked = "";
        format-disconnected = "⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr} ";
      };

      pulseaudio = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon} {format_source} ";
        format-bluetooth-muted = " {icon} {format_source} ";
        format-muted = " {format_source} ";
        format-source = "{volume}%  ";
        format-source-muted = " ";
        format-icons = {
          default = [
            "󰕿 "
            "󰖀 "
            "󰕾 "
          ];
        };
        on-click = "pavucontrol";
      };

      backlight = {
        format = "{percent}% {icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
        ];
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-full = "{capacity}% {icon}";
        format-chargind = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };

      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };
    };
  };

  programs.waybar.style = ''
    * {
      font-family: FontAwesome, iA Writer Quattro S, Nerd Font, Roboto, Helvetica, Arial, sans-serif;
      font-size: 13px;
    }

    window#waybar {
      background-color: rgba(43, 48, 59, 0.5);
      border-bottom: 3px solid rgba(100, 114, 125, 0.5);
      color: #ffffff;
      transition-property: background-color;
      transition-duration: .5s;
    }

    button {
      /* Use box-shadow instead of border so the text isn't offset */
      box-shadow: inset 0 -3px transparent;
      /* Avoid rounded borders under each button name */
      border: none;
      border-radius: 0;
    }

    button:hover {
      background: inherit;
      box-shadow: inset 0 -3px #ffffff;
    }

    #workspaces button {
      padding: 0 5px;
      background-color: transparent;
      color: #ffffff;
    }

    #workspaces button:hover {
      background: rgba(0, 0, 0, 0.2);
    }

    #workspaces button.focused, #workspaces button.active {
      background-color: #64727D;
      box-shadow: inset 0 -3px #ffffff;
    }

    #clock,
    #battery,
    #backlight,
    #network,
    #pulseaudio,
    #tray

    #workspaces {
      margin: 0 0px;
    }

    #clock {
      color: #ffffff;
      background-color: transparent;
      padding: 0 5px;
    }

    #battery {
      color: #ffffff;
      background-color: transparent;
      padding: 0 5px;
    }

    #backlight {
      color: #ffffff;
      background-color: transparent;
      padding: 0 5px;
    }

    #network {
      color: #ffffff;
      background-color: transparent;
      padding: 0 5px;
    }

    #pulseaudio {
      color: #ffffff;
      background-color: transparent;
      padding: 0 5px;
    }

    #tray {
      color: #ffffff;
      background-color: transparent;
      padding-left: 5px;
    }
  '';
}
