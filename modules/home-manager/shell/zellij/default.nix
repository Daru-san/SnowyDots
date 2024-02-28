{
  pkgs,
  config,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = false;
  };
}
