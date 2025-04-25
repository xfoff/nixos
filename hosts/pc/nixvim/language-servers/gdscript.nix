{ stdenv, fetchFromGitHub, ...}:

stdenv.mkDerivation {
  pname = "gdscript-lsp";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "bdunks";
    repo = "gdscript-language-server";
    rev = "ade3fc514b78b9c3dcdb51d17d7fc5cf147459d1";
    hash = "sha256-QarMhjRtRr5LFAkLbXe0p9IyOftycdqdGJkhk5YAAgw=";
  };
}
