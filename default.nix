let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation rec {
    pname = "Ukiyo";
    version = "0.3";

    src = ./.;  # This says "the source is the current directory"

    buildInputs = [ pkgs.gtk-engine-murrine ];

    installPhase = ''
      mkdir -p $out/share/themes/Ukiyo
      cp -r usr/share/themes/Ukiyo/* $out/share/themes/Ukiyo
      mkdir -p $out/share/icons/Ukiyo
      cp -r usr/share/icons/Ukiyo/* $out/share/icons/Ukiyo
    '';
  }
