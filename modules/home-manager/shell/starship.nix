{...}:{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableTransience = true;
    settings = {
      add_newline = false;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[!➜](bold red)";
      };

      package.disabled = true;
    };
  };
}
