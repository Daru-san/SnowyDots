{pkgs, ...}: {
  home.packages = with pkgs; [pyprland];
  systemd.user.services.pyprland = {
    Unit = {
      Description = "Pyprland startup service";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.pyprland}/bin/pypr";
      # ExecReload = "${pkgs.pyprland}/bin/pypr reload";
    };
    Install = {WantedBy = ["hyprland-session.target"];};
  };
  xdg.configFile."hypr/pyprland.toml".source = with pkgs;
    (formats.toml {}).generate "pyprland.toml" {
      pyprland = {
        plugins = ["scratchpads" "toggle_special"];
      };
      scratchpads = {
        term = {
          animation = "fromTop";
          command = "kitty --class kitty-dropterm";
          class = "kitty-dropterm";
          size = "70% 60%";
          max_size = "80% 70%";
          margin = 50;
        };
        volume = {
          animation = "fromRight";
          command = "pavucontrol";
          class = "pavucontrol";
          size = "40% 90%";
          unfocus = "hide";
          hysteresis = 0.7;
        };
        valent = {
          animation = "fromRight";
          command = "valent";
          class = "valent";
          size = "60% 80%";
        };
        bluetooth = {
          animation = "fromRight";
          command = "overskride";
          class = "io.github.kaii_lb.Overskride";
          size = "70% 70%";
          lazy = true;
        };
        btop = {
          animation = "fromBottom";
          command = "kitty --class btop --hold btop";
          class = "btop";
          size = "70% 70%";
        };
        blueman = {
          animation = "fromRight";
          command = "blueman-manager";
          class = ".blueman-manager-wrapped";
          size = "40% 40%";
          unfocus = "hide";
          lazy = true;
        };
        wifi = {
          animation = "fromRight";
          command = "iwgtk";
          class = "org.twosheds.iwgtk";
          size = "40% 60%";
          lazy = true;
        };
      };
    };
}
