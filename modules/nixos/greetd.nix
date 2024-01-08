{...}:{
  # Enable greetd using tuigreet
  services.greetd = {
    package = pkgs.greetd;
    enable = true;
    settings = rec {
     initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --window-padding 1 -g 'Welcome to ${config.networking.hostName}' -c sway";
        user = "daru";
     };
     default_session = initial_session;
    };
  };
}
