#Btop config
{config, pkgs, ...}: {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "adapta";
        theme_background = true;
      };
       extraConfig = ''
        truecolor = True
        force_tty = False
        presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty"
        vim_keys = Falserounded_corners
        rounded_corners = true
        graph_symbol = "braille"
        graph_symbol_cpu = "default"
        graph_symbol_mem = "default"
        graph_symbol_net = "default"
        graph_symbol_proc = "default"
        shown_boxes = "cpu mem net proc"
        update_ms = 400
        proc_sorting = "memory"
        proc_reversed = False 
        proc_tree = True 
        proc_colors = True
        proc_gradient = True 
        proc_per_core = True 
        proc_mem_bytes = True 
        proc_cpu_graphs = True 
        proc_info_smaps = False 
        proc_left = False 
        proc_filter_kernel = True
        cpu_graph_upper = "system"
        cpu_graph_lower = "user"
        cpu_invert_lower = True 
        cpu_single_graph = False 
        cpu_bottom = False 
        show_uptime = True 
        check_temp = True 
        cpu_sensor = "Auto" 
        show_coretemp = True 
        cpu_core_map = "" 
        temp_scale = "celsius" 
        base_10_sizes = False 
        show_cpu_freq = True 
        clock_format = "/user %X" 
        background_update = True 
        custom_cpu_name = "" 
        disks_filter = "exclude=/boot" 
        mem_graphs = True 
        mem_below_net = False 
        fs_arc_cached = True 
        show_swap = True 
        swap_disk = True 
        show_disks = True 
        only_physical = True 
        use_fstab = False 
        zfs_hide_datasets = False 
        disk_free_priv = False 
        show_io_stat = True 
        io_mode = False 
        io_graph_combined = False 
        io_graph_speeds = "/:480" 
        net_download = 100 
        net_upload = 100 
        net_auto = True 
        net_sync = True 
        net_iface = "" 
        show_battery = True 
        selected_battery = "Auto" 
        log_level = "WARNING"%                                   
        '';
  };
}
