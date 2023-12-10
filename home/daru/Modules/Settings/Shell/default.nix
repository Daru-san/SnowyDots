##Global shell configuration##
{config, pkgs, ...}:{
  imports = [
  #Import shell configs
  ./zsh.nix
  ./tmux.nix
  ./oh-my-posh.nix
  ];

  # Global shell aliases
  home.shellAliases = let
    git = "${config.programs.git.package}/bin/git";
    neofetch = "${pkgs.neofetch}/bin/neofetch";
    tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
  in {
    g = "${git}";
    nofetch = "${neofetch} --config none"; 
    clock = "${tty-clock} -bscBrnS";
  };
}
