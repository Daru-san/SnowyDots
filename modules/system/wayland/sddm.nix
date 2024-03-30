{
  pkgs,
  lib,
  ...
}: let
  wallpapers = pkgs.fetchgit {
    url = "https://github.com/D3Ext/aesthetic-wallpapers";
    rev = "060c580dcc11afea2f77f9073bd8710920e176d8";
    sha256 = "5MnW630EwjKOeOCIAJdSFW0fcSSY4xmfuW/w7WyIovI=";
  };
in
  with lib; {
    environment.systemPackages = with pkgs; [
      (where-is-my-sddm-theme.override {
        themeConfig.general.backgroundMode = "none";
      })
      (elegant-sddm.override {
        themeConfig.general.background = "${wallpapers}/images/wallpaper3-dark.png";
      })
    ];
    services.xserver = {
      enable = true;
      libinput.enable = true;
      displayManager = {
        sddm = {
          enable = true;
          package = mkDefault (with pkgs; kdePackages.sddm);
          theme = "Elegant";
          wayland.enable = true;
        };
      };
    };
  }
