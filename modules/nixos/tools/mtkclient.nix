{ pkgs, ... }:
let
  src = pkgs.fetchFromGitHub {
    owner = "bkerler";
    repo = "mtkclient";
    rev = "cf885a3f14e28004daa4cdb6e723f443620c4db5";
    hash = "sha256-+UU8YI9CYGdZCe8vCoHpl6qR709EFIg6oDDmFN/O0to=";
  };
in
{
  environment.systemPackages = [ pkgs.mtkclient ];
  services.udev.extraRules = ''
    ${builtins.readFile "${src}/mtkclient/Setup/Linux/50-android.rules"}
    ${builtins.readFile "${src}/mtkclient/Setup/Linux/51-edl.rules"}
  '';
}
