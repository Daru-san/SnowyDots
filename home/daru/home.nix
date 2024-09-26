# Home manager configuratiob file #
{
  home = rec {
    username = "daru";
    homeDirectory = "/home/${username}";
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
    json = {
      enable = true;
    };
    html = {
      enable = true;
    };
  };
}
