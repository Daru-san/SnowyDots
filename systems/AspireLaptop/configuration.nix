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
    yazi = {
      enable = true;
      settings = {
        manager = {
          ratio = [1 3 4];
          sort_by = "natural";
          sort_dir_first = true;
          show_hidden = true;
          show_symlink = true;
          linemode = "size";
        };
        log = {enabled = false;};
      };
    };
  };

  services.syncthing = {
    enable = true;
    dataDir = "/home/daru";
    user = "daru";
    configDir = "/home/daru/.sync";
    settings = {gui = {theme = "black";};};
  };

  environment.systemPackages = with pkgs; [
    htop
    wget2
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
    nix-rebuild
    hm-build
    scx
  ];

  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";

  networking.hostName = "AspireLaptop";

  system.stateVersion = "24.05";
}
