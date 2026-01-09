{
  config,
  pkgs,
  ...
}:
let
  name = config.home.username;
  user-js = pkgs.fetchFromGitHub {
    owner = "HorlogeSkynet";
    repo = "thunderbird-user.js";
    rev = "556709d1a4beced21f9888fb9b55dd623b415008";
    hash = "sha256-/noAaozmxe9nf6BjUMzHv0L64tZfpsVt62daimxH2Xk=";
  };
in
{
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird.override {
      extraPolicies.ExtensionSettings = {
        "uBlock0@raymondhill.net.xpi" = {
          installation_mode = "force_installed";
          install_url = "https://addons.thunderbird.net/thunderbird/downloads/latest/ublock-origin/latest.xpi";
        };
      };
    };
    profiles.${name} = {
      isDefault = true;
      extraConfig = builtins.readFile "${user-js}/user.js" + ''
        user_pref("javascript.enabled", true);
      '';

      feedAccounts = {
        ${name} = { };
      };

      settings = {
        "font.name.sans-serif.x-western" = "Rubik";
        "font.size.variable.x-western" = 17;
      };
    };
  };
}
