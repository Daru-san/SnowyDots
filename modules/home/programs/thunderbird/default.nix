{
  config,
  pkgs,
  inputs,
  system,
  ...
}:
let
  name = config.home.username;
  user-js = pkgs.fetchFromGitHub {
    owner = "HorlogeSkynet";
    repo = "thunderbird-user.js";
    rev = "2b839ae6cac30129c5bd0bf0d816824957095868";
    hash = "sha256-DxZ9dDSdOBUQtoQ1T1cHBgnrxK60p7fChIe3P1G84iA=";
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
      extraConfig =
        builtins.readFile "${user-js}/user.js"
        + ''
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
