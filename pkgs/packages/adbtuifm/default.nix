{
  buildGoModule,
  fetchFromGitHub,
  android-tools,
}:
buildGoModule rec {
  pname = "adbtuifm";
  version = "v0.5.8";
  src = fetchFromGitHub {
    owner = "darkhz";
    repo = pname;
    rev = version;
    hash = "sha256-TK93O9XwMrsrQT3EG0969HYMtYkK0a4PzG9FSTqHxAY=";
  };
  outputs = ["out"];
  buildInputs = [
    android-tools
  ];
}
