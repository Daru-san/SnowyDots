{
  programs.niri.settings = {
    workspaces = {
      "1" = {
        name = "System Info";
      };
      "2" = {
        name = "Browser";
      };
      "3" = {
        name = "Development";
      };
      "4" = {
        name = "Media & Games";
      };
      "5" = {
        name = "Files";
      };
      "6" = {
        name = "Content Creation";
      };
      "7" = {
        name = "Communication";
      };
      "8" = {
        name = "Virtualisation";
      };
      "9" = {
        name = "Docs";
      };
      "0" = {
        name = "Misc";
      };
    };
    window-rules = [
      {
        matches = [
          { app-id = "^firefox*"; }
          { app-id = "^floorp*"; }
          { app-id = "^zen-browser*"; }
          { app-id = "^brave*"; }
          { app-id = "^chromium*"; }
        ];
        open-on-workspace = "2";
      }
      {
        matches = [
          { title = "^spotify*"; }
          { app-id = "^spotify*"; }
          { app-id = "^freetube*"; }
          { app-id = "^mpv*"; }
          { app-id = "^prism*"; }
        ];
        open-on-workspace = "4";
      }
      {
        matches = [
          { app-id = "^nautilus*"; }
        ];
        open-on-workspace = "5";
      }
      {
        matches = [
          { title = "^btop*"; }
          { title = "^nvtop*"; }
        ];
        open-on-workspace = "1";
      }
      {
        matches = [
          { title = "^zathura*"; }
          { title = "^obsidian*"; }
        ];
        open-on-workspace = "9";
      }
      {
        matches = [
          { title = "^virt-manager*"; }
        ];
        open-on-workspace = "8";
      }
      {
        matches = [
          { app-id = "^telegram*"; }
          { app-id = "^ayugram*"; }
          { app-id = "^discord*"; }
          { app-id = "^whatsie*"; }
        ];
        open-on-workspace = "7";
      }
      {
        matches = [
          { app-id = "^gimp*"; }
          { app-id = "^krita*"; }
          { app-id = "^kdenlive*"; }
          { app-id = "^obs-studio*"; }
        ];
        open-on-workspace = "6";
      }
    ];
  };
}
