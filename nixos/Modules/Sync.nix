{...}:{
  services = {
    syncthing = {
      enable = true;
      user = "Daru";
      dataDir = "/home/daru";
      # folders = {
      #   "home/daru/Music/" = {
      #     id = "music";
      #     devices = ["FOSSDROID"];
      #   };
      # };
      # devices = {
      #   FOSSDROID = {
      #     addresses = [ 
      #     "tcp://192.168.0.245:5555"
      #     ]; 
      #     id = 
      #   };
      # };
    };
  };

}
