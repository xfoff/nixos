{
  lib,
  rustPlatform,
  fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "gdshader-lsp";
  version = "1.0.0";
  cargoHash = "sha256-FP3SMcafLbz3jqKTunCi4Z1CeZADLmmsIyWHQICmi8o=";

  src = fetchFromGitHub {
    owner = "GodOfAvacyn";
    repo = "gdshader-lsp";
    rev = "f3847df8a17cd66674b2ec058c020d80ff7d4f8f";
    hash = "sha256-kzZhHIRXW3m3n5TlNRDQO9XsDoSi59N7+4NeFKtauEM=";
  };

  meta = {
    description = "Language server implementation for the godot shader script";
    mainProgram = "gdshader-lsp";
    platforms = lib.platforms.linux;
  };
}
