{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
  environment.systemPackages = [ pkgs.sops ];
  sops.defaultSopsFile = ../../../secrets/secrets.json;
  sops.defaultSopsFormat = "json";
  sops.age.keyFile = "/home/daru/.config/sops/age/keys.txt";
  sops.secrets.nextcloud-secrets = {
    owner = "daru";
  };
}
