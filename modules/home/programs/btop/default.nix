{
  programs.btop = {
    enable = true;
    settings = {
      # Colorscheming
      color_theme = "flat-remix";
      theme_background = false;
      truecolor = true;

      # General
      vim_keys = true;
      rounded_corners = true;
      graph_symbol = "braille";
      shown_boxes = "cpu mem net proc gpu0";
      update_ms = 400;
      base_10_sizes = false;
      background_update = true;
      clock_format = "%d %b %R";
      log_level = ''"WARNING"%'';

      # Processes
      proc_sorting = "memory";
      proc_tree = true;
      proc_colors = true;
      proc_gradient = true;
      proc_per_core = true;
      proc_mem_bytes = true;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      proc_left = false;
      proc_aggregate = true;
      proc_filter_kernel = true;

      # CPU
      cpu_graph_upper = "system";
      cpu_graph_lower = "user";
      cpu_invert_lower = true;
      cpu_single_graph = false;
      cpu_bottom = true;
      show_uptime = true;
      check_temp = true;
      cpu_sensor = "Auto";
      show_coretemp = true;
      temp_scale = "celsius";
      show_cpu_freq = true;

      # Disks and memeory
      disks_filter = "exclude=/boot /nix /var/log /nix/store /etc /var /tmp /root";
      mem_graphs = true;
      mem_below_net = true;
      fs_arc_cached = true;
      show_swap = true;
      swap_disk = true;
      show_disks = true;
      only_physical = true;
      use_fstab = true;
      zfs_hide_datasets = false;
      disk_free_priv = false;
      show_io_stat = false;
      io_mode = false;
      io_graph_combined = false;
      io_graph_speeds = "/:480";

      # Network
      net_download = 100;
      net_upload = 100;
      net_auto = true;
      net_sync = true;

      # Battery
      show_battery = true;
      selected_battery = "Auto";
    };
  };
}
