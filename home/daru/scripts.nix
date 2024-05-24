{pkgs, ...}: let
  inherit (pkgs) writeShellApplication;
  runtimeDependencies = with pkgs; [nh git lix bash];
in {
  home.packages = [
    (writeShellApplication {
      name = "nh-home-update";
      inherit runtimeDependencies;
      text = ''
        nix flake update --commit-lock-file
        git push
        nh home switch -- -j 6 --cores 4
      '';
    })
    (writeShellApplication {
      name = "nh-system-update";
      inherit runtimeDependencies;
      text = ''
        nix flake update --commit-lock-file
        git push
        nh os switch -- -j 6 --cores 4
      '';
    })
  ];
}
