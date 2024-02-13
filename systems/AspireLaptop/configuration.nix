{
  pkgs,
  inputs,
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
    waydroid.enable = false;
  };

  programs = {
    # Enable gnome-disks
    gnome-disks = {enable = true;};
    # Enable KDE Connect
    kdeconnect = {enable = true;};
  };

  # Enable syncthing
  services.syncthing = {
    enable = true;
    dataDir = "/home/daru";
    user = "daru";
    configDir = "/home/daru/.sync";
    settings = {gui = {theme = "black";};};
  };

  # System packages
  environment.systemPackages = with pkgs;
    [
      ranger
      htop
      wget
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

  # wayland configuration
  # other options include sway, greetd and kde
  wayland = {
    enable = true;
    hyprland.enable = true;
    sddm.enable = true;
    gnome-extra.enable = true;
  };
  os.security.polkit.enable = true;

  # System configurations
  os = {
    boot = {
      enableSystemd-boot = true;
      quiet = true;
      plymouth.enable = true;
    };
    drivers = {intel.enable = true;};
  };

  # System tweaks for performance and maintainance
  os.system = {
    laptop.optimizations = {
      tlp.enable = true;
      powerTweaks.enable = true;
    };
    general = {
      ssd.enable = true;
      throttled.enable = true;
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
