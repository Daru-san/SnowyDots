{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Hardware configuration
    ./hardware-configuration.nix
  ];

  # User configurations
  users = {
    users = {
      daru = {
        isNormalUser = true;
        shell = pkgs.zsh;
        description = "Daru";
        extraGroups = ["networkmanager" "wheel" "video" "adbusers" "input"];
      };
      root.hashedPassword = "!";
    };
    mutableUsers = true;
  };

  programs = {
    nix-ld.enable = true;
    nix-ld.libraries = [
    ];
    # Enable gnome-disks
    gnome-disks = {enable = true;};
    # Enable KDE Connect
    kdeconnect = {
      enable = true;
      package = lib.mkDefault pkgs.kdePackages.kdeconnect-kde;
    };
  };

  # Enable syncthing
  services.syncthing = {
    enable = true;
    dataDir = "/home/daru";
    user = "daru";
    configDir = "/home/daru/.sync";
    settings = {gui = {theme = "black";};};
  };

  # Install and configure yazi
  programs.yazi = {
    enable = false;
    settings = {
      yazi = {
        manager = {
          ratio = [1 3 4];
          sort_by = "natural";
          sort_dir_first = true;
          show_hidden = false;
          show_symlink = false;
          linemode = "size";
        };
        log = {enabled = false;};
      };
    };
  };

  # System packages
  environment.systemPackages = with pkgs;
    [
      htop
      wget2
      git
      nix-prefetch-git
      nix-prefetch-github
      gcc
      glib
      nodejs_20
      unzip
      clang
      zig
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
    ]
    ++ (with inputs.scripts.packages.${pkgs.system}; [nix-rebuild hm-build]);

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";
  # Hostname
  networking.hostName = "AspireLaptop";

  system.stateVersion = "24.05";
}
