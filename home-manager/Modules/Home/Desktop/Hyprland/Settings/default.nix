{config, pkgs, lib, inputs, ...}: {
  
  imports = [
    ./binds.nix
    ./fonts.nix
    ./rules.nix  
  ];
  wayland.windowManager.hyprland = {
      enable = true;
      systemd = {
        enable = true;
      };
      settings = {
        source = [
          "extra.conf"
        ];
        general =  {
          gaps_in = 1.7;
          gaps_out = 6;
          border_size = 2.4;
          cursor_inactive_timeout = 4;
          layout = "master";
          "col.active_border" = ${config.colorScheme.colors.base02};
          "col.inactive_border" = ${config.colorScheme.colors.base00};            
        };
        input = {
          repeat_delay = 300;
          repeat_rate = 50;
          follow_mouse = 1;
          touchpad = {
            natural_scroll = true;
            disable_while_typing = true;
         };
        };
        master = {
          new_is_master = false;
          mfact = 0.55;
          allow_small_split = true;
          no_gabs_when_only = true;

        };
        decoration = {
          rounding = 5;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            ignore_opacity = true;
          };       
          drop_shadow = true;
          shadow_range = 7;
          shadow_render_power = 6;
        };
        animations = {
          enabled = true;
          bezier = [
            "linear, 0.0, 0.0, 1.0, 1.0"
            "def, 0.05, 0.9, 0.1, 1.05"
            "myBezier, 0.1, 0.6, 0.1, 1.05"
            "easeOutBack, 0.34, 1.56, 0.64, 1"
            "easeInOutBack, 0.68, -0.6, 0.32, 1.6"
            "easeInExpo, 0.7, 0, 0.84, 0"
            "easeOutCubic, 0.33, 1, 0.68, 1"
            "easeInOutQuad, 0.45, 0, 0.55, 1"
            "easeInOutCirc, 0.85, 0, 0.15, 1"
          ];
          animation = [
            "workspaces, 1, 8, myBezier, slidefadevert"
            "borderangle, 1, 100, linear, loop"
            "windowsOut, 1, 5, easeInOutBack, popin 80%"
            "windowsIn, 1 ,8, myBezier, popin 20%"
            "border ,1, 10, easeOutBack"
            "fade, 1, 7, myBezier"
          ];
        };
        exec = let
          wall-program = "swww";
          wallpaper = "~/Wallpapers/plant.png";
        in [
          # "zsh -c 'wall-script -w ${wall-program} -i ${wallpaper}'" #Wallpaper script, calling variables from wallpaper.nix file
          "${pkgs.swaynotificationcenter}/bin/swaync"
          "${config.programs.wpaperd.package}/bin/wpaperd"
        ];
        exec-once = [
          "${config.programs.waybar.package}/bin/waybar"
          "${config.programs.kitty.package}/bin/kitty -T Terminal"
          "${config.programs.kitty.package}/bin/kitty -T Git --session git.conf"
          "${pkgs.cool-retro-term}/bin/kitty -T Clock --hold tty-clock -bscBrn"
          "${pkgs.easyeffects}/bin/easyeffects"
          "${pkgs.networkmanagerapplet}/bin/nm-applet"
          "${config.services.copyq.package}/bin/copyq"
        ];
        bind = let
        swayosd = "${config.services.swayosd.package}/bin/swayosd";
        rofi = "${config.programs.rofi.package}/bin/rofi";
        rofi-bluetooth = "${pkgs.rofi-bluetooth}/bin/rofi-bluetooth";
        playerctl = "${config.services.playerctld.package}/bin/playerctl";
        playerctld = "${config.services.playerctld.package}/bin/playerctld";
        terminal = "${config.programs.kitty.package}/bin/kitty";
        browser = "${config.programs.firefox.package}/bin/firefox-nightly";
        file-manager = "${pkgs.gnome3.nautilus}/bin/nautilus";
        shotman = "${pkgs.shotman}/bin/shotman";
        editor = "${config.programs.neovim.package}/bin/nvim";
        ranger = "${pkgs.ranger}/bin/ranger";
        power-menu = "~/.config/rofi/Scrips/powermenu.sh";
        image-editor = "${pkgs.pinta}/bin/pinta";
        hdrop = "${inputs.hyprland-contrib.packages.${pkgs.system}.hdrop}/bin/hdrop";
      in [
        #Basic binds
        "SUPER,space,exec, ${rofi} -show drun"
        "SUPER, Return, exec, ${terminal}"
        "SUPER, e, exec, ${hdrop} '${file-manager}'"
        "SUPER, b, exec, ${rofi-bluetooth}"
        "SUPERALT, b, exec, ${hdrop} '${browser}'"
        "SUPER, x, exec, ${power-menu}"
        "SUPER, r, exec, kitty --hold ranger"
        "SUPER, z, exec, kitty --hold vi"
        "SUPER, i, exec, ${hdrop} '${image-editor}'"
        # Brightness control using swayosd
        ",XF86MonBrightnessUp, exec,swayosd --brightness=raise 5"
        ",XF86MonBrightnessDown, exec,swayosd --brightness=lower 5"
        # Volume
        ",XF86AudioRaiseVolume, exec, ${swayosd} --output-volume=raise 5"
        ",XF86AudioLowerVolume, exec, ${swayosd} --output-volume=lower 5"
        ",XF86AudioMute, exec, ${swayosd} --output-volume=mute-toggle"

        ",caps_lock,exec,${swayosd} --caps-lock"


        # Screenshotting
        ",Print,exec, ${shotman} --capture region"
        "SHIFT, print,exec, ${shotman} --capture output"
      ] ++

      (lib.optionals config.services.playerctld.enable [
        # Media control
        ",XF86AudioNext,exec,${playerctl} next"
        ",XF86AudioPrev,exec,${playerctl} previous"
        ",XF86AudioPlay,exec,${playerctl} play-pause"
        ",XF86AudioStop,exec,${playerctl} stop"
        "ALT,XF86AudioNext,exec,${playerctld} shift"
        "ALT,XF86AudioPrev,exec,${playerctld} unshift"
        "ALT,XF86AudioPlay,exec,systemctl --user restart playerctld"
      ]);
    };
  };
}

