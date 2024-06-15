{
  # boot.kernelPackages = pkgs.linuxPackages_6_9_hardened;
  programs.ssh.startAgent = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  security = {
    polkit.enable = true;
    forcePageTableIsolation = true;
    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
    };

    sudo = {
      enable = true;
      extraRules = [
        {
          commands =
            builtins.map (command: {
              command = "/run/current-system/sw/bin/${command}";
              options = ["NOPASSWD"];
            })
            ["poweroff" "reboot" "systemctl" "nixos-rebuild" "nix-env" "bandwhich" "usbtop" "powertop" "tlp-stat"];
          groups = ["wheel"];
        }
      ];
    };
  };
}
