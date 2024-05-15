{
  pkgs,
  lib,
  ...
}: {
  imports = [./hardware-configuration.nix];
  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = true;
    users.root.hashedPassword = "!";
    users.daru = {
      isNormalUser = true;
      useDefaultShell = true;
      description = "Daru";
      extraGroups = ["networkmanager" "wheel" "video" "adbusers" "input"];
    };
  };
  programs = {
    git.enable = true;
    nix-ld.enable = true;
    gnome-disks = {enable = true;};
    kdeconnect = {
      enable = true;
      package = lib.mkDefault pkgs.kdePackages.kdeconnect-kde;
    };
    yazi.enable = true;
  };

  services = {
    syncthing = {
      enable = true;
      dataDir = "/home/daru";
      user = "daru";
      configDir = "/home/daru/.sync";
      settings = {gui = {theme = "black";};};
    };
  };

  environment.systemPackages = with pkgs; [
    htop
    wget2
    nix-prefetch-git
    nix-prefetch-github
    unzip
    zip
    unrar
    p7zip
    commonsCompress
    iw
    clinfo
    glxinfo
    exfatprogs
    nurl
    nix-melt
    ncdu
    busybox
    usbutils
    gparted
    home-manager
    alejandra
    nix-inspect
    nixpkgs-review
    cachix
    file
    v4l-utils
  ];

  os = {
    system = {
      laptop = true;
      ssdTweaks = true;
    };
    networking = {
      wifi.enable = true;
      bluetooth.enable = true;
    };
  };
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";
}
