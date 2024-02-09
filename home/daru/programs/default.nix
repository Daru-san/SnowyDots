# Home packages
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
    freetube
    scrcpy
    keepassxc
    pqiv
    fragments
    bridge-core
    archiver
    floorp
    audacity
    overskride
  ]

  # GNOME specific packages
  ++ (with gnome;[
    nautilus
    dconf-editor
    gnome-clocks
  ])

  # These are pinned to 23.11(stable branch) since they're broken on unstable
  ++ (with pkgs.stable; [
    komikku
    calcure
  ])

  # Cli/Tui based packages
  ++ (with pkgs;
  [
      tree
      bc
      tty-clock
      libnotify
      speedtest-cli
      chroma
      glow
      gping
      nvtop-intel
      sysz
      nap
      nitch
      pulsemixer
      ani-cli
      pokeshell
      du-dust
      fzf
      unrar
      onefetch
      asciinema
      asciinema-agg
      asciinema-scenario
      trashy
      fontpreview
  ]);
}
