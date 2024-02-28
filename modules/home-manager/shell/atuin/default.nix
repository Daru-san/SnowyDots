{...}: {
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      style = "compact";
      show_preview = true;
    };
  };
}
