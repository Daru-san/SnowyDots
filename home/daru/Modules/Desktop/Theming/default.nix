{...}:{
  imports = [
    ./gtk.nix
    ./qt.nix
    ./fonts.nix
  ];

  #Set colorscheme
  colorScheme = {
    slug = "vibrantgreen";
    name = "Vibrant Green";
    author = "Daru-san";
    colors = {
      base00 = "#202220";
      base01 = "#A6E3A1";
      base02 = "#1A1F1A";
      base03 = "#102F2A";
      base04 = "#98ADA1";
      base05 = "#8abf97";
      base06 = "#313231";
      base07 = "#424242";
      base08 = "#79bf9f";
      base09 = "#918889";
      base0A = "#89F4FA";
      base0B = "#111B1B";
      base0C = "#25353A";
      base0D = "#111818";
      base0E = "#953B9D";
      base0F = "#59325C";
    };
  };
}
