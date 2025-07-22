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
    rev = "3ef9f511fd072ff3dbb6eb3c1c499a71f338967e";
    sha256 = "0pjghj2w0gdiksb6zi04yc5r217jckknw0ijayfdimfaidkv6w6z";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cp -r ${bg} $out/Backgrounds/astronaut.png
    sed -i '/PartialBlur="true"/c\PartialBlur="false"' $out/Themes/astronaut.conf
  '';
}
