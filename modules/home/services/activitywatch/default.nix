{pkgs, ...}: {
  services.activitywatch = {
    enable = false;
    watchers = {
      aw-watcher-wayland = {
        package = pkgs.aw-watcher-window-wayland;
        executable = "aw-watcher-window-wayland";
        settings = {
          poll_time = 2;
          timeout = 300;
        };
      };
    };
  };
}
