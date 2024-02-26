{
  config,
  pkgs,
  ...
}: {
  programs.zathura = {
    enable = true;
    package = pkgs.zathura.overrideAttrs (oa: {
      patches =
        (oa.patches or [])
        ++ [
          (pkgs.fetchpatch {
            name = "zathura-alpha";
            url = "https://gist.githubusercontent.com/miseran/0ea4b95e9816bf915b7b7171a5a0e42d/raw/a592b122717fd2a0325241963ec18fd2a4d1ab37/zathura-alpha.patch";
            sha256 = "sha256-sblo63YyK6CPOjcx+rw6DeHz4oTWN3xjvcQrrrZx7Uw=";
          })
          (pkgs.fetchpatch {
            name = "girara-alpha";
            url = "https://gist.githubusercontent.com/miseran/0ea4b95e9816bf915b7b7171a5a0e42d/raw/a592b122717fd2a0325241963ec18fd2a4d1ab37/girara-alpha.patch";
            sha256 = "sha256-RGbLJNk+sWj4esxSqWpFc33xu/DKyhSnceFkCJLTCiQ=";
          })
        ];
    });
    options = {
      recolor = true;
      recolor-keephue = true;
      default-bg = "rgba(255,255,255,0)";
      recolor-lightcolor = "rgba(255,255,255,0)";
      recolor-darkcolor = "black";
      font = config.fonts.serif.name;
      page-padding = 3;
      window-title-basename = true;
    };
  };
}
