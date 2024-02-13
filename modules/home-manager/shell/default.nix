# #Global shell configuration##
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./omp/default.nix
    ./zsh/default.nix
    ./autojump/default.nix
    # ./tmux/default.nix
  ];
  # Global shell theme
  programs.oh-my-posh.useTheme = "zash";

  # Global shell aliases
  home.shellAliases = let
    git = "${config.programs.git.package}/bin/git";
    neofetch = "${pkgs.neofetch}/bin/neofetch";
    tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
  in {
    g = "${git}";
    nofetch = "${neofetch} --config none";
    clock = "${tty-clock} -bscBrnS";
    nb = "nix-rebuild";
    hb = "hm-build";
  };
}
