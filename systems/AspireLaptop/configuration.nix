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
      #My main user
      daru = {
        isNormalUser = true;
        shell = pkgs.zsh;
        description = "Daru";
        extraGroups = ["networkmanager" "wheel" "video" "adbusers" "input"];
      };
      #Disables root user
      root.hashedPassword = "!";
    };
    mutableUsers = true;
  };

  # Enable android tools
  android = {
    adb.enable = true;
    mtp = {
      gvfs.enable = true;
      jmtpfs.enable = true;
    };
    waydroid.enable = true;
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

  os.security.polkit.enable = true;

  # System configurations
  os = {
    boot = {
      grub.enable = true;
      systemd.enable = false;
      quiet = true;
      plymouth.enable = true;
    };
  };

  # System options for drivers and optimizations
  os.system = {
    drivers.intel.enable = true;
    zram.enable = true;
    optimizations = {
      laptop.enable = true;
      ssd.enable = true;
      intel.enable = true;
      cpu.enable = true;
    };
  };

  # Enable audio using pipewire
  os.audio.enable = true;

  # Enable wifi and bluetooth
  os.networking = {
    enable = true;
    wifi.enable = true;
    bluetooth.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";
  # Hostname
  networking.hostName = "AspireLaptop";

  system.stateVersion = "24.05";
}
