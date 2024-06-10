{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  inherit (lib) getExe getExe' range concatLines;
  mod = config.wayland.windowManager.sway.config.modifier;
in {
  wayland.windowManager.sway.extraConfig = let
    workspaces = map toString (range 0 9);
  in
    concatLines [
      (concatLines (map
        (n: "bindsym --to-code ${mod}+${n} workspace number ${n}")
        workspaces))
      (concatLines (map
        (n: "bindsym --to-code ${mod}+Shift+${n} move container to workspace number ${n}")
        workspaces))
    ];
  wayland.windowManager.sway.config = {
    modifier = "Mod4";
    bindkeysToCode = true;
    keybindings = let
      inherit (config.wayland.windowManager.sway.config) terminal;
      yazi = getExe config.programs.yazi.package;
      playerctl = getExe config.services.playerctld.package;
      browser = getExe config.programs.firefox.package;
      launcher = config.wayland.windowManager.sway.config.menu;
      file-manager = getExe pkgs.gnome.nautilus;
      shotman = getExe pkgs.shotman;
      waybar = getExe config.programs.waybar.package;
      editor = getExe pkgs.neovim;
      hyprlock = getExe config.programs.hyprlock.package;
      copyq = getExe config.services.copyq.package;
      wlogout = getExe config.programs.wlogout.package;
      easyeffects = getExe config.services.easyeffects.package;
      color-picker = getExe inputs.scripts.packages.${pkgs.system}.color-picker;
      swaync = getExe' pkgs.swaynotificationcenter "swaync-client";
      swaymux = getExe pkgs.swaymux;
    in
      {
        #Basic binds
        "${mod}+d" = "exec pkill fuzzel || ${launcher}";
        "${mod}+q" = "exec ${terminal}";
        "${mod}+e" = "exec swaymsg -t get_tree | grep 'Nautilus' || ${file-manager}'";
        "${mod}+b" = "exec pidof firefox || ${browser}";
        "${mod}+x" = "exec pkill wlogout || ${wlogout}";
        "${mod}+r" = "exec ${terminal} -e ${yazi}";
        "${mod}+z" = "exec ${terminal} -e ${editor}";
        "${mod}+a" = "exec swaymsg -t get_tree | grep 'easyeffects' || ${easyeffects}";
        "${mod}+alt+b" = "exec pkill waybar || ${waybar}";

        #Window bings
        "alt+tab" = "exec pkill swaymux || ${swaymux}";
        "${mod}+shift+q" = "kill";
        "${mod}+grave" = "layout stacking";
        "${mod}+shift+e" = "exit";
        "${mod}+shift+r" = "exec swaymsg reload";
        "${mod}+v" = "floating toggle";
        "${mod}+f" = "fullscreen";

        #Lock screen
        "${mod}+l" = "exec ${hyprlock} --immediate";

        #Clipboard menu
        "${mod}+shift+v" = "exec ${copyq} menu";

        #Suspend
        "${mod}+alt+F12" = "exec systemctl suspend";

        #Color picker
        "${mod}+shift+c" = "exec ${color-picker}";

        # Screenshotting
        "Print" = "exec ${shotman} --capture region";
        "shift+print" = "exec ${shotman} --capture output";

        # Media control
        "XF86AudioNext" = "exec${playerctl} next";
        "XF86AudioPrev" = "exec${playerctl} previous";
        "XF86AudioPlay" = "exec${playerctl} play-pause";
        "XF86AudioStop" = "exec${playerctl} stop";

        #Same but for keyboards without media keys
        "shift+F12" = "exec ${playerctl} next";
        "shift+F9" = "exec ${playerctl} previous";
        "shift+F10" = "exec ${playerctl} play-pause";
        "shift+F11" = "exec ${playerctl} stop";

        "${mod}+n" = "exec ${swaync} -t";
        "${mod}+shift+n" = "exec ${swaync} -d";
        "${mod}+alt+n" = "exec ${swaync} -C";
      }
      // (let
        s = getExe' config.services.swayosd.package "swayosd-client";
        caps-lock = "exec ${s} --caps-lock";
        mute = "exec ${s} --output-volume mute-toggle";
        raise-volume = "exec ${s} --output-volume raise";
        lower-volume = "exec ${s} --output-volume lower";
        raise-brightness = "exec ${s} --brightness raise";
        lower-brightness = "exec ${s} --brightness lower";
      in {
        "XF86MonBrightnessUp" = raise-brightness;
        "XF86MonBrightnessDown" = lower-brightness;

        "XF86AudioRaiseVolume" = raise-volume;
        "XF86AudioLowerVolume" = lower-volume;
        "XF86AudioMute" = mute;

        "shift+F8" = raise-volume;
        "shift+F6" = lower-volume;
        "shift+F7" = mute;
        "caps_lock" = caps-lock;
      })
      // (let
        inherit (pkgs) formats;
        iniFormat = formats.ini {};
        foot-config = iniFormat.generate "foot.ini" {
          main.font = "JetbrainsMono Nerd Font:size=14";
        };
        foot = getExe pkgs.foot;
        netman = "exec ${foot} -c ${foot-config} -e nmtui";
      in {"${mod}+i" = netman;});
  };
}
