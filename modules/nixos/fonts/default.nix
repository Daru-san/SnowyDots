{pkgs, ...}: {
  # Custom console fonts for tty
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-124n.psf.gz";
    packages = with pkgs; [terminus_font];
    keyMap = "us";
  };

  # Installed Fonts
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = ["JetBrainsMono" "RobotoMono" "Noto"];
      })
    ];
  };
}
