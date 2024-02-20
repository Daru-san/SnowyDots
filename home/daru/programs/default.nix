# Home packages
{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [./desktop-entries.nix ./music/default.nix ./firefox/default.nix];

  # Overlay for standardnotes from https://github.com/NixOS/nixpkgs/issues/278191#issuecomment-1910865477
  nixpkgs.overlays = [
    (final: prev: {
      standardnotes-patch = let
        pname = "standardnotes";
        version = "3.183.22";
        src = prev.fetchurl {
          url = "https://github.com/standardnotes/app/releases/download/%40standardnotes%2Fdesktop%403.183.22/standard-notes-3.183.22-linux-x86_64.AppImage";
          hash = "sha256-tPbTgM13+c+wyhCAPawr3U71ofIHFN96x8QYes7RhfE=";
        };
        appimageContents = prev.appimageTools.extract {inherit pname version src;};
      in
        prev.appimageTools.wrapType2 {
          inherit pname version src;

          extraPkgs = pkgs: [pkgs.libsecret];

          extraInstallCommands = ''
            chmod -R +w $out
            mv $out/bin/${pname}-${version} $out/bin/${pname}

            ${prev.desktop-file-utils}/bin/desktop-file-install --dir $out/share/applications \
              --set-key Exec --set-value ${pname} ${appimageContents}/standard-notes.desktop
            ln -s ${appimageContents}/usr/share/icons $out/share
          '';
        };
    })
  ];

  home.packages = with lib;
    mkMerge [
      (with pkgs; [
        # GUI
        obsidian
        krita
        newsflash
        evince
        freetube
        scrcpy
        keepassxc
        pqiv
        fragments
        bridge-core
        archiver
        floorp
        audacity
        overskride
        pavucontrol
        standardnotes-patch

        # CLI
        tree
        bc
        tty-clock
        libnotify
        speedtest-cli
        chroma
        glow
        gping
        nvtop-intel
        sysz
        nap
        nitch
        pulsemixer
        ani-cli
        pokeshell
        du-dust
        fzf
        unrar
        onefetch
        asciinema
        asciinema-agg
        asciinema-scenario
        fontpreview
        rnix-lsp
      ])
      # GNOME related packages
      (with pkgs.gnome; [nautilus dconf-editor gnome-clocks])
      # These are pinned to 23.11(stable branch) since they're broken on unstable
      (with pkgs.stable; [komikku calcure])
      # Trash, a tool for trashing files in the terminal
      (with inputs.trash; [defaultPackage])
    ];
}
