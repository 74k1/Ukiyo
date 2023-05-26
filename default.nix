{ stdenv, fetchurl, gtk-engine-murrine }:

stdenv.mkDerivation rec {
  pname = "Ukiyo";
  version = "0.1";

  src = ./.;

  buildInputs = [ gtk-engine-murrine ];

  installPhase = ''
    mkdir -p $out/share/themes/Ukiyo
    cp -r usr/share/themes/Ukiyo/* $out/share/themes/Ukiyo
    mkdir -p $out/share/icons/Ukiyo
    cp -r usr/share/icons/Ukiyo/* $out/share/icons/Ukiyo
  '';
}
