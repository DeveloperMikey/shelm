{
  description = "shelm - my take on a hyprland shell using quickshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    quickshell = {
      url = "github:quickshell-mirror/quickshell/db77c71c216530159c2dcf5b269ebb4706b2e2dd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    quickshell,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        overlays = [];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in {
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              pkgs.coreutils
              quickshell.packages.x86_64-linux.default

              (pkgs.writeShellScriptBin "shelm" ''
                exec ${quickshell.packages.${system}.default}/bin/quickshell -c $(realpath ./config)
              '')
            ];
          };

        packages.default = pkgs.stdenv.mkDerivation {
          pname = "shelm";
          version = "0.2";
          src = ./config;
          buildInputs = [
            pkgs.makeWrapper
          ];
          installPhase = ''
            mkdir -p $out/bin
            makeWrapper ${quickshell.packages.x86_64-linux.default}/bin/quickshell $out/bin/shelm --add-flags "-c $out/config"
            cp $src $out/config -r
          '';
        };
      }
    );
}
