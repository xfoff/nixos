{ pkgs }:

let
  bg = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/xfoff/wallpapers/main/slugcatnest.jpg";
      sha256 = "18f68n9m1yxi3d53wkr1vs58xwvgiiajdqmgff3x70bzx21vwgpw";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "8993670e73d36f4e8edc70d13614fa05edc2575c";
    sha256 = "0pjf12x6420rnrbj7q059szfpswcy7y8srsij6dg513fkzj5fimq";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    rm $out/Backgrounds/1.png
    cp -r ${bg} $out/Backgrounds/1.png
    sed -i '/PartialBlur="true"/c\PartialBlur="false"' $out/Themes/theme1.conf
  '';
}
