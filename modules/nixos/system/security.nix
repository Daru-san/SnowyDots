{
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
            builtins.map
              (command: {
                command = "/run/current-system/sw/bin/${command}";
                options = [ "NOPASSWD" ];
              })
              [
                "poweroff"
                "reboot"
                "systemctl"
                "nix-env"
                "bandwhich"
                "usbtop"
                "powertop"
                "tlp-stat"
                "dmesg"
                "waydroid"
              ];
          groups = [ "wheel" ];
        }
      ];
    };
  };
}
