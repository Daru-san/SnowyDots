{pkgs, ...}: {
  services.activitywatch = {
    enable = true;
    watchers = {
      aw-watcher-afk = {
        package = pkgs.aw-watcher-afk;
        settings = {
          poll_time = 2;
          timeout = 300;
        };
      };
      aw-watcher-window = {
        package = pkgs.aw-watcher-window;
        settings = {
          poll_time = 30;
        };
      };
    };
  };
}
