{pkgs,...}:{
#Bootloader configs
  boot = {
    loader = {
      systemd-boot = {
        #Enable systemd-boot
        enable = false;
        #Disable editor
        editor = false;
        #Limit configurations to 10 max
        configurationLimit = 10;

        extraEntries = {
          "shutdown.conf" = ''
            title Shutdown

          '';
          "reboot.conf" = ''
            title Reboot
          '';
        };
      };
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        #Enable grub
        enable = true;
        #Use os prober to detect windows
        useOSProber = true;
        #Limit configuratios to 14 
        configurationLimit = 14;
        #Enable uefi support
        efiSupport = true;
      };
      grub2-theme = {
        enable = true;
        theme = "stylish";
        icon = "color";
        screen = "1080p";
      };
    };
    
    #Set the kernel to lqx unstable(Latest version)
    kernelPackages = pkgs.linuxPackages_lqx;

    #Make boot silent
    consoleLogLevel = 0; 
    plymouth = {
      enable = false;
    };
    kernelParams = [ "quiet" "udev.log_level=3" ];
    initrd = {
      verbose = false;
      availableKernelModules = [ "ahci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ ];
    };
    #Kernel modules
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
}
