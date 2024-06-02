{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_6_9_hardened;
  # Start the ssh agent at boot time
  programs.ssh.startAgent = true;

  services = {
    # Completely lock the system after suspend or reboot
    physlock = {
      enable = true;
      allowAnyUser = true;
      lockOn = {
        suspend = true;
        hibernate = true;
      };
    };
  };
  security = {
    protectKernelImage = false;
    lockKernelModules = false;
    forcePageTableIsolation = true;

    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
      packages = with pkgs; [apparmor-profiles];
    };

    sudo = {
      enable = true;
      execWheelOnly = true;
      extraRules = [
        {
          commands =
            builtins.map (command: {
              command = "/run/current-system/sw/bin/${command}";
              options = ["NOPASSWD"];
            })
            ["poweroff" "reboot" "nixos-rebuild" "nix-env" "bandwhich" "usbtop" "systemctl" "powertop" "tlp-stat"];
          groups = ["wheel"];
        }
      ];
    };
    polkit.enable = true;
  };
  # Kernel
  boot.kernel.sysctl = {
    # Hide kernel pointers from processes without the CAP_SYSLOG capability.
    "kernel.kptr_restrict" = 1;
    "kernel.printk" = "3 3 3 3";
    # Restrict loading TTY line disciplines to the CAP_SYS_MODULE capability.
    "dev.tty.ldisc_autoload" = 0;
    # Make it so a user can only use the secure attention key which is required to access root securely.
    "kernel.sysrq" = 4;
    # Protect against SYN flooding.
    "net.ipv4.tcp_syncookies" = 1;
    # Protect against time-wait assasination.
    "net.ipv4.tcp_rfc1337" = 1;
  };
}
