# #Global shell configuration##
{
  config,
  pkgs,
  ...
}: {
  imports = [./zsh.nix ./extras.nix ./tmux.nix];

  # Global shell theme
  programs.oh-my-posh.useTheme = "zash";

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
    git = "${config.programs.git.package}/bin/git";
    lazygit = "${config.programs.lazygit.package}/bin/lazygit";
    neofetch = "${pkgs.neofetch}/bin/neofetch";
    tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
    trash = "${pkgs.trashy}/bin/trash";
    yazi = "${config.programs.yazi.package}/bin/yazi";
  in {
    g = "${git}";
    lg = "${lazygit}";
    neofetch = "${neofetch} --config none";
    clock = "${tty-clock} -bscBrnS";
    nb = "nix-rebuild";
    hb = "hm-build";
    tp = "${trash} put";
    te = "${trash} empty";
    tls = "${trash} list";
    trs = "${trash} restore";
    y = "${yazi}";
    man = "batman";
    grep = "batgrep";
    cat = "${pkgs.bat}/bin/bat";
  };
}
