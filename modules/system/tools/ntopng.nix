{
  services.ntopng = {
    enable = true;
    interfaces = [
      "wlan0"
      "eth0"
    ];
  };
}
