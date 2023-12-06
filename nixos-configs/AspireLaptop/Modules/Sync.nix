{...}:{
  services = {
    syncthing = {
      enable = true;
      dataDir = "/home/daru";
      user = "daru";
      configDir = "/home/daru/.sync";
      settings = {
        gui = {
          theme = "black";
        };
        devices = {
          "Redmi 9C" = {
            addresses = [
              "[108.181.120.239]:443"
            ];
            id = "XTPRGH6-GZ6N4LL-FFOIXMP-QKMDKKR-2CPWNZT-GDGM3MJ-OAHTTFA-I2NFKAK";
          };
        };
      };
    };
  };
}
