{ pkgs, config, ... }:
{
  programs.rmpc = {
    enable = true;
    config = builtins.readFile (
      pkgs.runCommand "config" { } ''
        cat ${./config.ron} > $out
        substituteInPlace $out \
          --replace-fail "MPD_ADDR" ${config.services.mpd.network.listenAddress} \
          --replace-fail "MPD_PORT" ${toString config.services.mpd.network.port}
      ''
    );
  };
}
