{ inputs, outputs, ... }:

let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
  inherit (lib) mapAttrs;
  inherit (lib.attrsets) filterAttrs;
in
rec {
  forEachSystem = lib.genAttrs [
    "aarch64-linux"
    "x86_64-linux"
  ];

  forEachPkgs = f:
    forEachSystem
      (system:
        f nixpkgs.legacyPackages.${system});
}
