{
  programs.niri.settings = {
    window-rules = [
      {
        variable-refresh-rate = true;
        draw-border-with-background = false;
        open-maximized = true;
        clip-to-geometry = true;
        geometry-corner-radius = {
          top-left = 6.0;
          top-right = 6.0;
          bottom-left = 6.0;
          bottom-right = 6.0;
        };
      }
      {
        matches = [
          { app-id = "^org\.keepassxc\.KeePassXC$"; }
          { app-id = "^org\.gnome\.World\.Secrets$"; }
          { app-id = "iwgtk"; }
          { app-id = "com.github.hluk.copyq"; }
          { app-id = "org.twosheds.iwgtk"; }
          { app-id = "Generate Password"; }
          { app-id = "^nmtui$"; }
          { app-id = "valent"; }
        ];
        block-out-from = "screencast";
      }
      {
        open-maximized = false;
        matches = [
          { app-id = "file-roller"; }
          { app-id = "foot"; }
          { app-id = "nm-connection-editor"; }
          { app-id = ".blueman-manager-wrapped"; }
          { app-id = "org.twosheds.iwgtk"; }
          { app-id = "com.github.hluk.copyq"; }
          { app-id = "com.github.wwmm.easyeffects"; }
          { app-id = "Generate Password"; }
          { app-id = "org.gnome.FileRoller"; }
          { app-id = "nmtui"; }
          { app-id = "pulsemixer"; }
          { app-id = "valent"; }
          { app-id = "io.github.kaii_lb.Overskride"; }
        ];
      }
    ];
  };
}
