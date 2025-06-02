{
  pkgs,
  lib
}:

pkgs.stdenv.mkDerivation (finalAttrs: {
  pname = "gdshader-lsp";
  version = "0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "GodOfAvacyn";
    repo = "gdshader-lsp";
    rev = "f3847df8a17cd66674b2ec058c020d80ff7d4f8f";
    fetchSubmodules = true;
    hash = "sha256-kzZhHIRXW3m3n5TlNRDQO9XsDoSi59N7+4NeFKtauEM=";
  };

  nativeBuildInputs = [
    pkgs.cargo
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp -r ./* $out/bin
  '';

  meta = {
    description = "Language server implementation for the godot shader script";
    mainProgram = "gdshader-lsp";
    platforms = lib.platforms.linux;
  };
})
