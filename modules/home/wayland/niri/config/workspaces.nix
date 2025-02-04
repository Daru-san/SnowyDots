{
  programs.niri.settings = {
    workspaces = {
      "1" = {
        name = "sys";
      };
      "2" = {
        name = "web";
      };
      "3" = {
        name = "dev";
      };
      "5" = {
        name = "media";
      };
      "4" = {
        name = "files";
      };
      "6" = {
        name = "content";
      };
      "7" = {
        name = "chat";
      };
      "8" = {
        name = "vm";
      };
      "9" = {
        name = "docs";
      };
      "10" = {
        name = "misc";
      };
    };
    window-rules = [
      {
        matches = [
          { app-id = "^firefox$"; }
          { app-id = "floorp"; }
          { app-id = "^zen-browser$"; }
          { app-id = "^brave$"; }
          { app-id = "^chromium$"; }
        ];
        open-on-workspace = "web";
      }
      {
        matches = [
          { title = "^spotify$"; }
          { app-id = "^spotify$"; }
          { app-id = "Freetube"; }
          { app-id = "^mangayomi$"; }
          { app-id = "^mpv$"; }
          { app-id = "^prism$"; }
        ];
        open-on-workspace = "media";
      }
      {
        matches = [
          { app-id = "org.gnome.Nautilus"; }
          { app-id = "oculante"; }
          { app-id = "io.github.giantpinkrobots.varia"; }
        ];
        open-on-workspace = "files";
      }
      {
        matches = [
          { title = "^btop$"; }
          { title = "^nvtop$"; }
        ];
        open-on-workspace = "sys";
      }
      {
        matches = [
          { title = "org.pwmt.zathura"; }
        ];
        open-on-workspace = "docs";
      }
      {
        matches = [
          { app-id = ".virt-manager-wrapped"; }
          { app-id = "^waydroid$"; }
        ];
        open-on-workspace = "vm";
      }
      {
        matches = [
          { app-id = "^telegram$"; }
          { app-id = "com.ayugram.desktop"; }
          { app-id = "^discord$"; }
          { app-id = "com.ktechpit.whatsie"; }
        ];
        open-on-workspace = "chat";
      }
      {
        matches = [
          { app-id = "^Gimp$"; }
          { app-id = "^krita$"; }
          { app-id = "org.kde.kdenlive"; }
          { app-id = "^com.obsproject.Studio"; }
        ];
        open-on-workspace = "content";
      }
    ];
  };
}
