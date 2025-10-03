{ pkgs, config, ... }:
{
  programs.rmpc = {
    enable = true;
    config = pkgs.runCommand "config" { } ''
      substituteInPlace ${./config.ron} $out \
        --replace-fail "MPD_ADDR" ${config.services.mpd.network.listenAddress} \
        --replace-fail "MPD_PORT" ${toString config.services.mpd.network.port}
    '';
  };
}
