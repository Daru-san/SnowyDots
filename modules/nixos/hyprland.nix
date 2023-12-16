# Enable hyprland with greetd
{pkgs, config, ...}:{

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
  };
  # Fix swaylock not unlocking
  security.pam.services.swaylock.text = ''
    auth include login
   '';

  # Enable dconf
  programs.dconf.enable = true;

  # Enable greetd using tuigreet
  services.greetd = {
    package = pkgs.greetd;
    enable = true;
    settings = rec {
     initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --window-padding 1 -g 'Welcome to ${config.networking.hostName}' -c Hyprland";
        user = "daru";
     };
     default_session = initial_session;
    };
  };
}
