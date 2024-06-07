{pkgs, ...}: {
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
    driSupport = true;
    driSupport32Bit = true;
  };
}
