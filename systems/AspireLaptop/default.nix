{
  pkgs,
  inputs,
  system,
  outputs,
  ...
}:{

  # Import the main system configuration
  imports = [./configuration.nix] ++ (with outputs.nixosModules; [
    android
    audio
    fonts
    neovim
    shell
    system
    wayland
  ]);

  # User configurations
  users = {
    users = {
      #My main user
      daru = {
        isNormalUser = true;
        shell = pkgs.zsh;
        description = "Daru";
        extraGroups = [ "networkmanager" "wheel" "video" "adbusers" "input"];
      };
      #Disables root user
    root.hashedPassword = "!";
    };
  mutableUsers = true;
  };

  # Extra fonts I use on this system 
  fonts.packages = with pkgs; [
    monocraft
    minecraftia
  ];

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
    gnome-disks = {
      enable = true;
    };
    # Enable KDE Connect 
    kdeconnect = {
      enable = true;
    };
  };
  
  # Enable syncthing
  services = {
    syncthing = {
      enable = true;
      dataDir = "/home/daru";
      user = "daru";
      configDir = "/home/daru/.sync";
      settings = {
        gui = {
          theme = "black";
        };
      };
    };
  };

  # System packages
  environment.systemPackages = with pkgs; [
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
  ] ++ (with inputs.useful-scripts.packages.${system}; [
    nix-rebuild
    hm-build
  ]);

  # wayland configuration
  wayland = {
    enable = true;
    sway = {
      enable = false;
      swayfx.enable = true;
    };
    hyprland.enable = true;
    greetd = {
      enable = true;
      command = "Hyprland";
      user = "daru";
    };
    gnome-extra.enable = true;
    lxpolkit.enable = true;
    kde.enable = false;
  };
  os.security.polkit.enable = true;
}
