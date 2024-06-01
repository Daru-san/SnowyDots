{lib, ...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$java"
        "$nix_shell"
        "$sudo"
        "$character"
        "$shell"
      ];
      right_format = lib.concatStrings [
        "$cmd_duration"
      ];
      java = {
        format = ''[java:v((''$version)) ]($style)'';
        symbol = "";
      };
      git_branch = {
        format = ''[git:($branch(:$remote_branch )) ]($style)'';
        symbol = "";
      };
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
      package.disabled = true;

      nix_shell = {
        impure_msg = "[impure shell](bold red)";
        pure_msg = "[pure shell](bold green)";
        unknown_msg = "[unknown shell](bold yellow)";
        format = "[nix-shell:($state( \($name\))](bold blue) ";
      };
    };
  };
}
