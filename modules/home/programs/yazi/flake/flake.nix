{
  inputs = {
    tokyo-night = {
      url = "github:BennyOe/tokyo-night.yazi";
      flake = false;
    };
    exifaudio = {
      url = "github:Sonico98/exifaudio.yazi";
      flake = false;
    };
    glow = {
      url = "github:Reledia/glow.yazi";
      flake = false;
    };
    mime = {
      url = "github:DreamMaoMao/mime.yazi";
      flake = false;
    };
    bat = {
      url = "github:mgumz/yazi-plugin-bat";
      flake = false;
    };
    fg = {
      url = "github:DreamMaoMao/fg.yazi";
      flake = false;
    };
  };
  outputs = {self, ...} @ inputs: {};
}
