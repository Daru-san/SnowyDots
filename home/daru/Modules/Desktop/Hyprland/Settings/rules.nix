#Window and workspace rules
{...}:{
    wayland.windowManager.hyprland = {
      settings = {
        windowrulev2 = [
          #Task manager-like window for system monitoring 
          "workspace special:usage,class:(kitty),title:(SystemMonitor)"
          "center 1,class:(kitty),title:(SystemMonitor)"

          #Special rules for firefox
          "float,class:(firefox-nightly),title:(Library)"
        ];
        windowrule = [
          #Window specific worspaces
          "workspace name:7,^(krita)$"
          "workspace name:8,^(pqiv)$"
          #Productivity workspaces
          "workspace name:F1,^(firefox-nightly)$"
          "workspace name:F2,^(Logseq)$"
          "workspace name:F3,^(libreoffice)$"
          "workspace name:F4,^(org.kde.dolphin)$"

          #Entertainment workspaces
          "workspace name:F5,^(info.febvre.Komikku)$"
          "workspace name:F6,^(vlc)$"
          "workspace name:F8,^(Spotify)$"
          "fullscreen,^(Spotify)$"
          "workspace name:F7,^(FreeTube)$"
          
          #Others
          "workspace name:F9,^(io.github.martinrotter.rssguard)$"
          "workspace name:F10,^(org.kde.okular)$"
          "workspace name:F11,^(mpv)$"
            
            #Floating windows 
           "float,^(nm-applet)$"
           "float,^(pavucontrol)$"
           "float,^(.blueman-manager-wrapped)$"
           "float,^(com.github.hluk.copyq)$"
           "float,^(com.github.wwmm.easyeffects)$"
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
