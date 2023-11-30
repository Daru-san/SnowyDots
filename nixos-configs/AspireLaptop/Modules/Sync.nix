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
              "tcp://fd11:2bad:3f46:0:c0e0:6ce4:3f2:76e4:22000"
            ];
            id = "XTPRGH6-GZ6N4LL-FFOIXMP-QKMDKKR-2CPWNZT-GDGM3MJ-OAHTTFA-I2NFKAK";
          };
        };
      };
    };
  };
}
