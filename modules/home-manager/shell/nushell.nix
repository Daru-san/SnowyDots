{
  programs.nushell = {
    enable = true;
    extraConfig = with builtins; readFile ./config.nu;
    shellAliases = {
      c = "clear";
      r = "reset";
      y = "yazi";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
    };
  };
}
