{...}: {
  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/nix-community/home-manager/ee7db2c6bc257486c37c38dba17ec2f3719de3ac/modules/services/wlsunset.nix";
    })
  ];
  programs.wlsunset = {
    enable = true;
  };
}
