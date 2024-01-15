{
  android = import ./android/default.nix;
  audio = import ./audio/default.nix;
  fonts = import ./fonts/default.nix;
  shell = import ./shell/default.nix;
  system = import ./system/default.nix;
  wayland = import ./wayland/default.nix;
}
