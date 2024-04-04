{pkgs, ...}: {
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-124n.psf.gz";
    packages = [pkgs.terminus_font];
    keyMap = "us";
  };

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = [
      (pkgs.nerdfonts.override {
        fonts = ["JetBrainsMono" "RobotoMono" "Noto"];
      })
    ];
  };
}
