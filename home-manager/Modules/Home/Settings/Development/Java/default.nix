{config, pkgs ,...}:{
  programs.java = {
    enable = true;
    package = pkgs.openjdk17;
  };
}
