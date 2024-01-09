#Home programs
{config, pkgs, lib, outputs, ...}:{
  imports = with outputs.homeManagerModules; [
    # KDE connect and syncthing
    kdeconnect
    syncthing
  ]++[
    ./btop/btop.nix
    ./desktop-entries.nix
    ./mpv/default.nix
    ./music/default.nix
    ./ranger/ranger.nix
    ./firefox/default.nix
    ./translate-shell/default.nix
  ];

  # GUI
  home.packages = with pkgs; 
  [
    obsidian
    krita
    newsflash
    evince
    gnome.nautilus
    gnome.dconf-editor
    freetube
    komikku
    scrcpy
    keepassxc
    pqiv
    losslesscut-bin
    fragments
    gnome.gnome-clocks
    bridge-core
    archiver
  ] ++ (with pkgs;  #TUI
  [
      tree
      bc
      tty-clock 
      libnotify
      ddgr
      speedtest-cli
      chroma
      glow
      gping
      nvtop-intel
      sysz
      nap
      jrnl 
      calcure
      nitch
      pulsemixer
      ani-cli
      pokeshell
      du-dust
      fzf
      unrar
  ]);
}
