{
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule (finalAttrs: {
  pname = "gh-s";
  version = "0.0.8";
  src = fetchFromGitHub {
    owner = "gennaro-tedesco";
    repo = "gh-s";
    rev = "v${finalAttrs.version}";
    hash = "sha256-hLfaAtWiJHCJ7MFz8dg4SJJB2cNY1gKUEwMAdRB4lr8=";
  };
  vendorHash = "";
})
