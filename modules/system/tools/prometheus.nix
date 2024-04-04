{config, ...}: {
  services.prometheus = {
    enable = true;
    port = 9001;
    exporters.node = {
      enable = true;
      enabledCollectors = [
        "cpu"
        "diskstats"
        "netdev"
        "hwmon"
        "os"
        "filesystem"
        "meminfo"
      ];
      port = 9002;
    };
    scrapeConfigs = [
      {
        job_name = "laptop";
        static_configs = [
          {
            targets = ["127.0.0.1:${toString config.services.prometheus.exporters.node.port}"];
          }
        ];
      }
    ];
  };
}
