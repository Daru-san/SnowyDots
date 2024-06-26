{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "cgroup_no_v1=all"
      "systemd.unified_cgroup_hierarchy=yes"
      "nowatchdog"
      "modprobe.blacklist=iTCO_wdt"
      "usbcore.autosuspend=-1"
    ];
  };
  boot.kernel.sysctl = {
    "vm.swappiness" = 90;
    "vm.vfs_cache_pressure" = 50;
    "vm.dirty_background_ratio" = 20;
    "vm.dirty_ratio" = 50;
    "kernel.sched_latency_ns" = 4000000;
    "kernel.sched_min_granularity_ns" = 500000;
    "kernel.sched_wakeup_granularity_ns" = 50000;
    "kernel.sched_migration_cost_ns" = 250000;
    "kernel.sched_cfs_bandwidth_slice_us" = 3000;
    "kernel.sched_nr_migrate" = 128;
  };
}
