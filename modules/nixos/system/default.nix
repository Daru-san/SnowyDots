{...}: {
  imports = [
    ./boot/default.nix
    ./devices/default.nix
    ./network/default.nix
    ./security/default.nix
    ./plymouth/default.nix
    ./audio/default.nix
    ./drivers/default.nix
  ];
}
