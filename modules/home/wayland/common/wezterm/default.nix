{
  programs.wezterm = {
    extraConfig = builtins.readFile ./config.lua;
  };
}
