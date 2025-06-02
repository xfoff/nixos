{ pkgs, steam-run, unzip }:

pkgs.stdenv.mkDerivation {
  name = "curseforge";
  version = "1.0.0";

  src = pkgs.fetchurl {
    url = "https://curseforge.overwolf.com/downloads/curseforge-latest-linux.zip";
    sha256 = "19x24d7cw3jra85d412hfp6xjfrd404xfpj326qc4kp6fgb1cbf3";
  };

  buildInputs = [ steam-run unzip ];

  installPhase = ''
    mkdir -p $out
    unzip $src -d $out
    steam-run $(find $out -name "*.AppImage") --appimage-extract
    touch "$out/test"
  '';
}
