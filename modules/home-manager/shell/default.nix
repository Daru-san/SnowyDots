##Global shell configuration##
{config, pkgs, ...}:{
  # Global shell theme
  programs.oh-my-posh.useTheme = "pararussel"; 

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
    wayconfig = "bash -c pkill waybar && env GTK_DEBUG=interactive ${waybar}";
    nb = "nix-rebuild";
    hb = "hm-build";
  };
}
