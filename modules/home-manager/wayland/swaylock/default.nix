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
      fade-in = 0.7;

      effect-blur = "20x2";
      effect-scale = 0.5;
      indicator = true;
      indicator-radius = 230;
      indicator-thickness = 14;
      indicator-caps-lock =  true;
    };
  };
  xdg.configFile."swaylock/config".text = pkgs.lib.mkDefault(pkgs.lib.mkAfter (builtins.readFile ./colors));
}
