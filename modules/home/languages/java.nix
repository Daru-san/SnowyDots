{pkgs, ...}: {
  programs.java = {
    enable = true;
    package = pkgs.jdk;
  };
  home.sessionVariables = {
    JAVA_8_HOME = "${pkgs.jre8}/lib/openjdk/jre";
    JAVA_11_HOME = "${pkgs.jdk11}/lib/openjdk";
    JAVA_17_HOME = "${pkgs.jre17_minimal}";
  };
}
