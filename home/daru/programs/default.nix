#Home programs
{pkgs, ...}:{
  imports = [
    ./desktop-entries.nix
    ./music/default.nix
    ./firefox/default.nix
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
    scrcpy
    keepassxc
    pqiv
    fragments
    gnome.gnome-clocks
    # bridge-core
    archiver
    floorp
  ] ++ (with pkgs.stable; [
    komikku
    calcure
  ]) ++ (with pkgs;  #TUI
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
      nitch
      pulsemixer
      ani-cli
      # pokeshell
      du-dust
      fzf
      unrar
      onefetch
  ]);
}
