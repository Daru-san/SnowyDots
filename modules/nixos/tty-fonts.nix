# Enable custom console fonts
{pkgs, ...}:{
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-124n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  }; 
}
