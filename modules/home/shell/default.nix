{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./fish
    ./extras.nix
    ./starship
    ./nix-index
  ];

  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.dataHome}/bash/history";
    historySize = 10000;
    historyControl = [
      "erasedups"
      "ignorespace"
    ];
  };

  # Global shell aliases
  home.shellAliases =
    let
      bat = "${config.programs.bat.package}/bin/bat";
      tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
      trashy = "${pkgs.trashy}/bin/trashy";
      fzf = "${config.programs.fzf.package}/bin/fzf";
    in
    {
      clock = "${tty-clock} -bscBrnS";
      tp = "${trashy} put";
      te = "${trashy} empty";
      cat = bat;
      trashy-empty = "${trashy} list | ${fzf} --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs ${trashy} empty --match=exact --force";
      trashy-restore = "${trashy} list | ${fzf} --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs ${trashy} restore --match=exact --force";
      zc = "clear && z";
    };
}
