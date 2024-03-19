# #Global shell configuration##
{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [./zsh.nix ./extras.nix ./tmux.nix];

  # Enable bash for oh-my-posh support
  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.dataHome}/bash/history";
    historySize = 10000;
    historyControl = ["erasedups" "ignorespace"];
  };

  # Enable command-not-found
  programs.command-not-found.enable = true;

  # Global shell aliases
  home.shellAliases = let
    bat = "${pkgs.bat}/bin/bat";
    git = "${config.programs.git.package}/bin/git";
    firefox = "${lib.getExe config.programs.firefox.package}";
    lazygit = "${config.programs.lazygit.package}/bin/lazygit";
    neofetch = "${pkgs.neofetch}/bin/neofetch";
    tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
    trash = "${pkgs.trashy}/bin/trash";
    yazi = "${config.programs.yazi.package}/bin/yazi";
  in {
    g = git;
    lg = lazygit;
    neofetch = "${neofetch} --config none";
    clock = "${tty-clock} -bscBrnS";
    nb = "nix-rebuild";
    hb = "hm-build";
    tp = "${trash} put";
    te = "${trash} empty";
    tls = "${trash} list";
    trs = "${trash} restore";
    y = yazi;
    man = "batman";
    grep = "batgrep";
    cat = bat;
    inherit firefox;
  };
}
