{pkgs, ...}:{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      ignore-empty-password = true;
      font = "Jetbrains Mono Nerd Font";
      clock = true;
      timestr = "%R";
      datestr= "%a, %d of %B";
      screenshots =  true;
    };
  };
}
