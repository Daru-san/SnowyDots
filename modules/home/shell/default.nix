# #Global shell configuration##
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [./zsh ./extras.nix ./tmux ./nushell ./oh-my-posh];

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
    trashy = "${inputs.trashy.defaultPackage.${pkgs.system}}/bin/trashy";
    yazi = "${config.programs.yazi.package}/bin/yazi";
    fzf = "${config.programs.fzf.package}/bin/fzf";
  in {
    g = git;
    lg = lazygit;
    neofetch = "${neofetch} --config none";
    clock = "${tty-clock} -bscBrnS";
    nb = "nix-rebuild";
    hb = "hm-build";
    tp = "${trashy} put";
    te = "${trashy} empty";
    y = yazi;
    man = "batman";
    grep = "batgrep";
    cat = bat;
    trashy-empty = "${trashy} list | ${fzf} --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs ${trashy} empty --match=exact --force";
    trashy-restore = "${trashy} list | ${fzf} --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs ${trashy} restore --match=exact --force";
    inherit firefox;
  };
}
