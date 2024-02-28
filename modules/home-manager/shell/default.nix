# #Global shell configuration##
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./omp/default.nix
    ./zsh/default.nix
    ./zoxide/default.nix
    ./zellij/default.nix
  ];
  # Global shell theme
  programs.oh-my-posh.useTheme = "zash";

  programs.eza = {
    enable = true;
    git = true;
    icons = true;
    extraOptions = ["--group-directories-first" "--header"];
    enableAliases = true;
  };

  # Global shell aliases
  home.shellAliases = let
    git = "${config.programs.git.package}/bin/git";
    neofetch = "${pkgs.neofetch}/bin/neofetch";
    tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
    trash = "${pkgs.trashy}/bin/trash";
    yazi = "${config.programs.yazi.package}/bin/yazi";
  in {
    g = "${git}";
    nofetch = "${neofetch} --config none";
    clock = "${tty-clock} -bscBrnS";
    nb = "nix-rebuild";
    hb = "hm-build";
    tp = "${trash} put";
    te = "${trash} empty";
    tls = "${trash} list";
    trs = "${trash} restore";
    y = "${yazi}";
  };
}
