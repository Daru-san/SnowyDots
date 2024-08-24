{pkgs, ...}: {
  imports = [./hardware-configuration.nix];
  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = true;
    users.root.hashedPassword = "!";
    users.daru = {
      shell = pkgs.fish;
      isNormalUser = true;
      useDefaultShell = true;
      description = "Daru";
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "adbusers"
        "input"
        "uinput"
      ];
    };
  };
  programs = {
    nix-ld.enable = true;
    gnome-disks = {
      enable = true;
    };
    kdeconnect = {
      enable = true;
      package = pkgs.valent;
    };
    yazi.enable = false;
  };
  environment.systemPackages = with pkgs; [
    htop
    nix-prefetch-git
    nix-prefetch-github
    unzip
    zip
    unrar
    p7zip
    clinfo
    glxinfo
    exfatprogs
    nurl
    uutils-coreutils-noprefix
    jmtpfs
    stable.nix-melt
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
    bandwhich
  ];
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";
}
