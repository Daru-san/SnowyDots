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
      enable = true;
      theme = "loader_alt";
      themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["loader_alt"];})];
    };
    kernelParams = [ "quiet" "udev.log_level=3" ];
    initrd = {
      verbose = false;
      availableKernelModules = [ "ahci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ ];
      systemd = {
      	enable = true;
      };
    };
    #Kernel modules
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-124n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  }; 
  #Add the system76-scheduler
  services.system76-scheduler = {
    enable = true;
    useStockConfig = true;
  };
}
