#This file is specifically for my Hyprland configurations and can be toggled in the 'desktop.nix' file
{pkgs, ...}:{

  #Enable Hyprland
  programs.hyprland = {
    enable = true;

    #Set hyprland to unstable
    package = pkgs.hyprland;
  };
  #Fix swaylock not unlocking
  security.pam.services.swaylock.text = ''
    auth include login
   '';

  #Enable greetd using tuigreet
  services.greetd = {
    package = pkgs.greetd;
    enable = true;
    settings = rec {
     initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --window-padding 1 -g 'Welcome to AspireNix' -c Hyprland";
        user = "daru";
     };
     default_session = initial_session;
    };
  };
}
