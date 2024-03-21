{
  programs.nushell = {
    enable = true;
    configFile = ./config.nu;
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
