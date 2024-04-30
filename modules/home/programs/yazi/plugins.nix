{pkgs, ...}: let
  inherit (pkgs) fetchFromGitHub;
in {
  xdg.configFile = {
    "yazi/theme.toml".source =
      fetchFromGitHub {
        owner = "catppuccin";
        repo = "yazi";
        rev = "0846aed69b2a62d29c98e100af0cf55ca729723d";
        hash = "sha256-2T41qWMe++3Qxl9veRNHMeRI3eU4+LAueKTss02gYNk=";
      }
      + "/themes/mocha.toml";
    "yazi/plugins/exifaudio.yazi".source = fetchFromGitHub {
      owner = "Sonico98";
      repo = "exifaudio.yazi";
      rev = "94329ead8b3a6d3faa2d4975930a3d0378980c7a";
      hash = "sha256-jz6fVtcLHw9lsxFWECbuxE7tEBttE08Fl4oJSTifaEc=";
    };
    "yazi/plugins/glow.yazi".source = fetchFromGitHub {
      owner = "Reledia";
      repo = "glow.yazi";
      rev = "cf1f1f0a36a0411fcc99d3666692a543fc626f3d";
      hash = "sha256-U4ullcOwN6TCaZ8gXCPMk/fGbtZLe4e1Y0RhRKLZKng=";
    };
    "yazi/plugins/mime.yazi".source = fetchFromGitHub {
      owner = "DreamMaoMao";
      repo = "mime.yazi";
      rev = "4afd840b8380edd5be145b0562934cd9ef300916";
      hash = "sha256-zLirGpcF2ygCnxUU9vrGB3zBzZbDyc4DdJlGTHD7lRI=";
    };
    "yazi/plugins/bat.yazi".source = fetchFromGitHub {
      owner = "mgumz";
      repo = "yazi-plugin-bat";
      rev = "1925c200632f017119dd685601b5f2d7d4ab266b";
      hash = "sha256-gfJdXhumrWthAsK6xo6sYEHZrXM0FFyS1ad8GgHHwQ8=";
    };
    "yazi/plugins/fg.yazi".source = fetchFromGitHub {
      owner = "DreamMaoMao";
      repo = "fg.yazi";
      rev = "cc53d56a673e5ec2cf48a6f18bc76d83aa61d52d";
      hash = "sha256-xUZdmDZhbUzX5Ka2xogRQJI52EL81n9ZLrcxDacgfN0=";
    };
  };
}
