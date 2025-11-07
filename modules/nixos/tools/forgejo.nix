{
  pkgs,
  config,
  ...
}:
{
  # services.nginx = {
  #   virtualHosts.${cfg.settings.server.DOMAIN} = {
  #     forceSSL = true;
  #     enableACME = true;
  #     extraConfig = ''
  #       client_max_body_size 512M;
  #     '';
  #     locations."/".proxyPass = "http://localhost:${toString srv.HTTP_PORT}";
  #   };
  # };

  services.forgejo = {
    enable = false;
    database.type = "postgres";
    # Enable support for Git Large File Storage
    lfs.enable = true;
    settings = {
      DEFAULT.APP_NAME = "Geijutsu no ie";
      server = {
        DOMAIN = "git.sandaru.com";
        # ROOT_URL = "https://${srv.DOMAIN}/";
        HTTP_PORT = 3000;
      };
      service.DISABLE_REGISTRATION = true;
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "github";
      };
      other = {
        SHOW_FOOTER_VERSION = false;
      };
    };
  };

  services.gitea-actions-runner = {
    package = pkgs.forgejo-runner;
    instances.default = {
      enable = false;
      name = "monolith";
      url = "https://git.sandaru.com";
      token = "";
      # Obtaining the path to the runner token file may differ
      # tokenFile should be in format TOKEN=<secret>, since it's EnvironmentFile for systemd
      # tokenFile = config.age.secrets.forgejo-runner-token.path;
      labels = [
        "ubuntu-latest:docker://node:16-bullseye"
        "ubuntu-22.04:docker://node:16-bullseye"
        "ubuntu-20.04:docker://node:16-bullseye"
        "ubuntu-18.04:docker://node:16-buster"
        "native:host"
      ];
    };
  };
}
