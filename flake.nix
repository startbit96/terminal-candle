{
  description = "mazes: maze-generation and maze-solving in rust.";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [ 
          rustc
          cargo
          rustfmt
          rust-analyzer
          clippy
          libiconv # https://stackoverflow.com/questions/68679040/error-linking-with-cc-failed-exit-code-1-for-cargo-run
        ];
      };
      
    });
}
