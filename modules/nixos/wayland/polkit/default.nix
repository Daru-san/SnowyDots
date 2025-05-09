{
  pkgs,
  lib,
  ...
}:
let
  command = pkgs.stdenv.mkDerivation {
    pname = "polkit";
    version = "1";
    src = ./.;
    nativeBuildInputs = [ pkgs.makeWrapper ];
    buildPhase = ''
      mkdir -p $out/bin
      install -Dm775 $src/polkit-script.sh $out/bin/polkit
    '';
    installPhase = ''
      wrapProgram $out/bin/polkit \
      --prefix PATH : ${
        lib.makeBinPath (
          with pkgs;
          [
            cmd-polkit
            zenity
            jq
          ]
        )
      }
    '';
    meta.mainProgram = ["polkit"];
  };
in
{
  systemd.user.services.cmd-polkit = {
    serviceConfig.ExecStart = lib.getExe command;
    wantedBy = [ "graphical-session.target" ];
  };
}
