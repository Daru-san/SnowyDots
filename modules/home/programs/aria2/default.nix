{
  programs.aria2 = {
    enable = true;
    settings = {
      listen-port = 60000;
      dht-listen-port = 60000;
      seed-ratio = 1.0;
      max-upload-limit = "50K";
      ftp-pasv = true;
      max-concurrent-download = 7;
      check-integrity = true;
      lowest-speed-limit = "50K";
      always-resume = true;
    };
  };
}
