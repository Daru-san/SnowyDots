{ config, ... }:
{
  programs.beets = {
    enable = true;
    mpdIntegration = {
      enableStats = true;
      enableUpdate = true;
    };
    settings = {
      directory = "${config.home.homeDirectory}/Music";
      library = "${config.home.homeDirectory}/Music/.beets/music.db";
      import = {
        move = false;
      };
      plugins = [
        "musicbrainz"
        "deezer"
        "convert"
        "badfiles"
        "embedart"
        "fetchart"
        "spotify"
        "missing"
        "duplicates"
      ];
    };
  };
}
