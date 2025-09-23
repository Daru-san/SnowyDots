{ config, ... }:
{
  programs.beets = {
    enable = true;
    mpdIntegration = {
      enableStats = true;
      enableUpdate = true;
    };
    settings = {
      directory = config.xdg.userDirs.music;
      library = "${config.xdg.userDirs.music}.beets/music.db";
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
