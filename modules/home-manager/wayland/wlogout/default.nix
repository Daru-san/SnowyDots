{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."wlogout/icons" = let
    repo = pkgs.fetchFromGitHub {
      owner = "ArtsyMacaw";
      repo = "wlogout";
      rev = "0a4289e02c6c4337756d4df7ff31605f8c8795c3";
      hash = "sha256-cTscfx+erHVFHwwYpN7pADQWt5sq75sQSyXSP/H8kOs=";
    };
  in {
    source = "${repo}/icons";
    recursive = true;
  };

  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "swaylock -fF";
        text = "lock";
        keybind = "l";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Log out";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Sleep";
        keybind = "c";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
    ];
    style = let
      dir = "/usr/share/wlogout/icons";
    in ''
      window {
           font-family: ${config.gtk.font.name};
           font-size: 0px;
           background-color: rgba(0, 0, 0, 0.5);
       }
       button {
           background-repeat: no-repeat;
           background-position: center;
           background-size: 50%;
           border: none;
           background-color: rgba(0, 0, 0, 0);
           margin: 5px;
           border-radius: 0px;
           transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
       }
       button:hover {
       }
       button:focus {
           border: ${
        toString
        config.wayland.windowManager.hyprland.settings.general.border_size
      }px;
           border-radius: ${
        toString
        config.wayland.windowManager.hyprland.settings.decoration.rounding
      }px;
       }
       /** ********** Icons ********** **/
       #lock {
           background-image: image(url("icons/lock.png"), url("${dir}/lock.png"));
       }

       #logout {
           background-image: image(url("icons/logout.png"), url("${dir}/logout.png"));
       }

       #suspend {
           background-image: image(url("icons/suspend.png"), url("${dir}/suspend.png"));
       }

       #hibernate {
           background-image: image(url("icons/hibernate.png"), url("${dir}/hibernate.png"));
       }

       #shutdown {
           background-image: image(url("icons/shutdown.png"), url("${dir}/shutdown.png"));
       }

       #reboot {
           background-image: image(url("icons/reboot.png"), url("${dir}/reboot.png"));
       }
    '';
  };
}
