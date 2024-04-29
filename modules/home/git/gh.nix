{
  pkgs,
  stdenv,
  ...
}: {
  programs = {
    gh-dash.enable = true;
    gh = {
      enable = true;
      extensions =
        (with pkgs; [
          gh-poi
          gh-markdown-preview
          gh-eco
          gh-notify
          gh-down
          gh-f
          ghq
          gh-cal
          gh-token
          ghfetch
        ])
        ++ [
          (pkgs.buildGoModule (finalAttrs: {
            pname = "gh-s";
            version = "0.0.8";
            src = {
              owner = "gennaro-tedesco";
              repo = "gh-s";
              rev = "v${finalAttrs.version}";
              hash = "sha256-hLfaAtWiJHCJ7MFz8dg4SJJB2cNY1gKUEwMAdRB4lr8=";
            };
            vendorHash = "";
          }))
          (stdenv.mkDerivation (finalAttrs: {
            pname = "gh-download";
            version = "0.6.1";
            src = pkgs.fetchFromGitHub {
              owner = "yuler";
              repo = "gh-download";
              rev = "v${finalAttrs.version}";
              hash = "sha256-thaAkam5oC0+m7B9yGpOU8V8wyF0R3BOCGz8fko+QQk=";
            };
            nativeBuildInputs = [pkgs.makeWrapper];
            buildPhase = ''
              mkdir -p $out/bin
              cp $src/gh-download $out/bin/gh-download
            '';
            installPhase = ''
              wrapProgram $out/bin/gh-download'';
          }))
        ];
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
        aliases = {
          co = "pr checkout";
          pv = "pr view";
        };
      };
    };
  };
}
