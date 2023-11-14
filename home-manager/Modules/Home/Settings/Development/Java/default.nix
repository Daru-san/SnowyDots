{config, pkgs ,...}:{
  programs.java = {
    enable = true;
    package = pkgs.unstable.openjdk17;
  };
}
