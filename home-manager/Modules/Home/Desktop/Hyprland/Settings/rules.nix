#Window and workspace rules
{config, ...}:{
    wayland.windowManager.hyprland = {
      settings = {

        windowrulev2 = [
          #Task manager-like window for system monitoring 
          "workspace special:usage,class:(kitty),title:(SystemMonitor)"
          "center 1,class:(kitty),title:(SystemMonitor)"
          "workspace special:taskmgr,class:(mission-center)"
          "workspace name:1,class:(kitty),title(Terminal)" 
          "workspace name:2,class:(kitty),title:(Git)"

          #Special rules for firefox
          "workspace special:PrivFox,class:(firefox-nightly),title:(Firefox Nightly Private Browsing)"
          "float,class:(firefox-nightly),title:(Library)"

          "workspace name:F11,class:(kitty),title:(Files)"
          "workspace name:F12 silent,class:(kitty),title:(Clock)"
          "fullscreen,class:(kitty),title:(Clock)"
  
        ];
        windowrule = [
          #Window specific worspaces
          "workspace name:7,^(pinta)$"
          "workspace name:8,^(pqiv)$"
          #Productivity workspaces
          "workspace name:F1,^(firefox-nightly)$"
          "workspace name:F2,^(obisidian)$"
          "workspace name:F3,^(libreoffice)$"
          "workspace name:F4,^(org.gnome.Nautilus)$"

          #Entertainment workspaces
          "workspace name:F5,^(info.febvre.Komikku)$"
          "workspace name:F6,^(vlc)$"
          "workspace name:F8,^(Spotify)$"
          "fullscreen,^(Spotify)$"
          "workspace name:F7,^(FreeTube)$"
          
          #Others
          "workspace name:F9,^(io.gitlab.news_flash.NewsFlash)$"
          "workspace name:F10,^(evince)$"

          #Special workspaces
          "workspace special:audio silent,^(com.github.wwmm.easyeffects)$"
          "workspace special:mink silent,^(cr.fr.bionus.Grabber)$"
            
            #Floating windows 
           "float,^(nm-applet)$"
           "float,^(pavucontrol)$"
           "float,^(.blueman-manager-wrapped)$"
           "float,^(com.github.hluk.copyq)$"
           "fullscreen,^(vlc)$"
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
