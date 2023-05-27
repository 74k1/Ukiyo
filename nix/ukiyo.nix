{ inputs, outputs, pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "Ukiyo";
  version = "0.3.0";

  src = ./..;

  buildInputs = with pkgs; [
    gtk-engine-murrine
    # inputs.rix101.packages."x86_64-linux".win2xcur
  ];

  # buildPhase = ''
  #   # TODO: build with the win2xcur
  #   # win2xcur ukiyo-new/*.cur -o ukiyo/
  # '';

  installPhase = ''
    mkdir -p $out/share/themes/Ukiyo
    cp -r usr/share/themes/Ukiyo/* $out/share/themes/Ukiyo
    mkdir -p $out/share/icons/Ukiyo
    cp -r usr/share/icons/Ukiyo/* $out/share/icons/Ukiyo
  '';
}
