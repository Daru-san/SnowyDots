{pkgs, ...}: {
  programs.java = {
    enable = true;
    package = pkgs.jdk;
  };
  # home.sessionVariables = {
  #   JAVA_8_HOME = "${pkgs.jdk8}/lib/openjdk";
  #   JAVA_11_HOME = "${pkgs.jdk11}/lib/openjdk";
  #   JAVA_17_HOME = "${pkgs.jdk17}/lib/openjdk";
  #   JAVA_19_HOME = "${pkgs.jdk19}/lib/openjdk";
  # };
}
