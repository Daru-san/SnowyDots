#Window and workspace rules
{...}:{
    wayland.windowManager.hyprland = {
      settings = {
        windowrulev2 = [
          #Task manager-like window for system monitoring 
          "workspace special:usage,class:(kitty),title:(SystemMonitor)"
          "center 1,class:(kitty),title:(SystemMonitor)"

          # Music in terminal using cmus
          "workspace name:F6,class:(kitty),title:(cmus)"

          #Special rules for firefox
          "float,class:(firefox-nightly),title:(Library)"
        ];
        windowrule = let
          f = regex: "float, ^(${regex})$";
          c = regex: "center, ^(${regex})";
        in [
          # Floating windows
          (f "pavucontrol")
          (f ".blueman-manager-wrapped")
          (f "com.github.hluk.copyq")
          (f "com.github.wwmm.easyeffects")

          # Center them
          (c "pavucontrol")
          (c ".blueman-manager-wrapped")
          (c "com.github.hluk.copyq")
          (c "com.github.wwmm.easyeffects") 
        ] ++ [
          #Window specific worspaces
          "workspace name:7,^(krita)$"
          "workspace name:8,^(pqiv)$"
          "workspace name:8,^(waypaper)$"
          #Productivity workspaces
          "workspace name:F1,^(firefox-nightly)$"
          "workspace name:F2,^(Anytype)$"
          "workspace name:F4,^(org.gnome.nautilus)$"

          #Entertainment workspaces
          "workspace name:F5,^(info.febvre.Komikku)$"
          "workspace name:F6,^(mpv)$"
          "workspace name:F7,^(FreeTube)$"
          "workspace name:F8,^(Spotify)$"
          "workspace name:F8,^(Comfify)"
          
          #Others
          "workspace name:F9,^(io.gitlab.news_flash.NewsFlash)$"
          "workspace name:F10,^(evince)$"
            
          #Floating windows 
           "size 56%,^(com.github.wwmm.easyeffects)$"

          # wlogout
          "fullscreen,^(wlogout)$"
          "noanim,^(wlogout)$"
          "stayfocused,^(wlogout)$"
        ];
        workspace = [
          "name:1, persistent:true"
          "name:F1, default:true, persistent:true"
          "name:F9, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
          "name:F10, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
          "name:F11, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
          "name:F12, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
        ];
      };
    };
  }
##workspace guidelines
#1-9 anything(mostly terminals)
#F1-F4 Productivity i.e obisidian, libreoffice, firefox
#F5-F8 Media i.e ani-cli, freetube, cmus, spotify
#F9-F12 Anything else i.e clock screensaver, newsflash, evince
