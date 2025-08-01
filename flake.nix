{
  description = "shelm - my take on a hyprland shell using quickshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    quickshell = {
      url = "github:quickshell-mirror/quickshell/a5431dd02dc23d9ef1680e67777fed00fe5f7cda";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    app2unit = {
      url = "github:soramanew/app2unit";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    quickshell,
    app2unit,
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
              app2unit.packages.${pkgs.system}.default

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
            app2unit.packages.${pkgs.system}.default
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
