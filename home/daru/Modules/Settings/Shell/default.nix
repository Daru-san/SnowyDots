##Global shell configuration##
{config, pkgs, outputs, ...}:{
  imports = with outputs.homeManagerModules; [
    # Modules specific imports
    bash
    autojump
    oh-my-posh
  ] ++ [
    # Import shell configs
    ./zsh.nix
    ./tmux.nix
  ];
  
  # Global shell theme
  programs.oh-my-posh.useTheme = "bubblesline"; 

  # Global shell aliases
  home.shellAliases = let
    git = "${config.programs.git.package}/bin/git";
    neofetch = "${pkgs.neofetch}/bin/neofetch";
    tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
    waybar = "${config.programs.waybar.package}/bin/waybar";
in {
    g = "${git}";
    nofetch = "${neofetch} --config none"; 
    clock = "${tty-clock} -bscBrnS";
    hm-build-ex = "rm-containersjson && ${pkgs.nix-scripts}/bin/hm-build";
    wayconfig = "pkill waybar && env GTK_DEBUG=interactive ${waybar}";
    nb = "nix-rebuild";
    hb = "hm-build";
  };
}
