{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  inherit (lib)
    getExe
    getExe'
    range
    concatLines
    cli
    ;
  inherit (cli)
    toGNUCommandLineShell
    ;
  mod = config.wayland.windowManager.sway.config.modifier;
in
{
  wayland.windowManager.sway.extraConfig =
    let
      workspaces = map toString (range 0 9);
    in
    concatLines [
      (concatLines (map (n: "bindsym --to-code ${mod}+${n} workspace number ${n}") workspaces))
      (concatLines (
        map (n: "bindsym --to-code ${mod}+Shift+${n} move container to workspace number ${n}") workspaces
      ))
    ];
  wayland.windowManager.sway.config = {
    modifier = "Mod4";
    bindkeysToCode = true;
    keybindings =
      let
        inherit (config.wayland.windowManager.sway.config) terminal;
        exec = cmd: "exec ${cmd}";
        yazi = getExe config.programs.yazi.package;
        playerctl = getExe config.services.playerctld.package;
        browser = getExe config.programs.zen.package;
        launcher = config.wayland.windowManager.sway.config.menu;
        file-manager = getExe pkgs.nautilus;
        flameshot = getExe config.services.flameshot.package;
        editor =
          (getExe pkgs.neovide)
          + " "
          + toGNUCommandLineShell { } {
            neovim-bin = getExe config.env.editor.package;
          };
        hyprlock = getExe config.programs.hyprlock.package;
        clipse = getExe pkgs.clipse-gui;
        easyeffects = getExe config.services.easyeffects.package;
        color-picker = getExe inputs.color-picker.packages.${pkgs.system}.default;
        iwgtk = getExe pkgs.iwgtk;
      in
      {
        #Basic binds
        "${mod}+d" = exec "pkill anyrun || ${launcher}";
        "${mod}+q" = exec terminal;
        "${mod}+e" = exec file-manager;
        "${mod}+b" = exec "pidof zen-browser || ${browser}";
        "${mod}+r" = exec "${terminal} -e ${yazi}";
        "${mod}+z" = exec editor;
        "${mod}+a" = exec "swaymsg -t get_tree | grep 'easyeffects' || ${easyeffects}";
        "${mod}+i" = exec "pkill iwgtk || ${iwgtk}";
        "${mod}+p" = exec "pkill pulsemixer || ${terminal} --class pulsemixer --detach pulsemixer";

        #Window bings
        "${mod}+shift+q" = "kill";
        "${mod}+grave" = "layout stacking";
        "${mod}+shift+e" = "exit";
        "${mod}+shift+r" = "exec swaymsg reload";
        "${mod}+v" = "floating toggle";
        "${mod}+f" = "fullscreen";

        #Lock screen
        "${mod}+l" = exec "${hyprlock} --immediate";

        #Clipboard menu
        "${mod}+shift+v" = exec "pkill clipse-gui || ${clipse}";

        #Suspend
        "${mod}+alt+F12" = exec "systemctl suspend";

        #Color picker
        "${mod}+shift+c" = exec color-picker;

        # Screenshotting
        "Print" = exec "${flameshot} gui";
        "shift+print" = exec "${flameshot} screen";

        # Media control
        "XF86AudioNext" = exec "${playerctl} next";
        "XF86AudioPrev" = exec "${playerctl} previous";
        "XF86AudioPlay" = exec "${playerctl} play-pause";
        "XF86AudioStop" = exec "${playerctl} stop";

        #Same but for keyboards without media keys
        "shift+F12" = exec "${playerctl} next";
        "shift+F9" = exec "${playerctl} previous";
        "shift+F10" = exec "${playerctl} play-pause";
        "shift+F11" = exec "${playerctl} stop";
      }
      // (
        let
          s = getExe' config.services.swayosd.package "swayosd-client";
          caps-lock = "exec ${s} --caps-lock";
          mute = "exec ${s} --output-volume mute-toggle";
          raise-volume = "exec ${s} --output-volume raise";
          lower-volume = "exec ${s} --output-volume lower";
          raise-brightness = "exec ${s} --brightness raise";
          lower-brightness = "exec ${s} --brightness lower";
        in
        {
          "XF86MonBrightnessUp" = raise-brightness;
          "XF86MonBrightnessDown" = lower-brightness;

          "XF86AudioRaiseVolume" = raise-volume;
          "XF86AudioLowerVolume" = lower-volume;
          "XF86AudioMute" = mute;

          "shift+F8" = raise-volume;
          "shift+F6" = lower-volume;
          "shift+F7" = mute;
          "caps_lock" = caps-lock;
        }
      )
      // (
        let
          o = getExe pkgs.obs-cmd;
          r = "recording";
        in
        {
          "${mod}+F2" = "exec ${o} ${r} start";
          "${mod}+F3" = "exec ${o} ${r} stop";
        }
      )
      // {
        "${mod}+tab" = "focus next";
        "${mod}+shift+tab" = "focus prev";
        "${mod}+g" = "layout tabbed";
        "${mod}+shift+g" = "layout default";
        "${mod}+page_up" = "workspace prev";
        "${mod}+page_down" = "workspace next";
        "${mod}+ctrl+right" = "focus next";
        "${mod}+ctrl+left" = "focus prev";
      };
  };
}
