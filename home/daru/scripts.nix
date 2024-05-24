{pkgs, ...}: let
  inherit (pkgs) writeShellApplication;
  runtimeInputs = with pkgs; [nh git nix bash];
in {
  home.packages = [
    (writeShellApplication {
      name = "nh-home-update";
      inherit runtimeInputs;
      text = ''
        nix flake update --commit-lock-file
        git push
        nh home switch -- -j 6 --cores 4
      '';
    })
    (writeShellApplication {
      name = "nh-system-update";
      inherit runtimeInputs;
      text = ''
        nix flake update --commit-lock-file
        git push
        nh os switch -- -j 6 --cores 4
      '';
    })
    (writeShellApplication {
      name = "nix-flake-push";
      inherit runtimeInputs;
      text = ''
        nix flake update --commit-lock-file
        git push
      '';
    })
  ];
}
