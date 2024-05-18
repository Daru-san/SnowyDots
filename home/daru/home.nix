# Home manager configuratiob file #
{
  home = {
    username = "daru";
    homeDirectory = "/home/daru";
    enableNixpkgsReleaseCheck = false;
  };

  # Make neovim the default editor
  home.sessionVariables.EDITOR = "nvim";

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Home option pages
  manual = {
    json = {enable = true;};
    html = {enable = true;};
  };
}
