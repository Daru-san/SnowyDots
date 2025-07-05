{ pkgs, ... }:
{
  security.enableWrappers = true;
  security.wrappers = {
    btop = {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+p";
      source = "${pkgs.btop}/bin/btop";
    };
  };
}
