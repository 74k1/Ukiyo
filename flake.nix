{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    # rix101 = {
    #   url = "github:reo101/rix101";
    # };
  };

  outputs =
    { self
    , nixpkgs
    # , rix101
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      util = import ./nix/util.nix {
        inherit inputs outputs;
      };
    in rec {
      packages = util.forEachPkgs (pkgs: {
        default = pkgs.callPackage ./nix/ukiyo.nix {
          inherit inputs outputs;
        };
      });
    };
}
