{
  inputs = let
    flake = false;
  in {
    tokyo-night = {
      url = "github:BennyOe/tokyo-night.yazi";
      inherit flake;
    };
    exifaudio = {
      url = "github:Sonico98/exifaudio.yazi";
      inherit flake;
    };
    glow = {
      url = "github:Reledia/glow.yazi";
      inherit flake;
    };
    mime = {
      url = "github:DreamMaoMao/mime.yazi";
      inherit flake;
    };
    bat = {
      url = "github:mgumz/yazi-plugin-bat";
      inherit flake;
    };
    fg = {
      url = "github:DreamMaoMao/fg.yazi";
      inherit flake;
    };
  };
}
