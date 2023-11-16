{pkgs,...}:{
#Bootloader configs
  boot = {
    loader = {
      systemd-boot = {
        #Enable systemd-boot
        enable = true;
        #Disable editor
        editor = false;
        #Limit configurations to 10 max
        configurationLimit = 10;
      };
      efi = {
        canTouchEfiVariables = true;
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
