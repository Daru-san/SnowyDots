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
      url = "github:DreamMaoMao/mime.yazi/e910658a9fd200404a1b8d613cb65b509b7cda1c";
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
