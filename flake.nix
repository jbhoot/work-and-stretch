{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }:
  let
    systems = [ "x86_64-darwin" "aarch64-darwin" "x86_64-linux" ];
    createDevShell = system: 
    let 
      pkgs = import nixpkgs {inherit system;};
    in
    pkgs.mkShell {
      buildInputs = [
        pkgs.ocaml
        pkgs.ocamlPackages.findlib
        pkgs.dune_2
        pkgs.ocamlPackages.ocaml-lsp
        pkgs.ocamlformat
        pkgs.ocamlPackages.utop

        pkgs.ocamlPackages.re

        pkgs.mpv
      ];
    };
  in
  {
    devShell = nixpkgs.lib.genAttrs systems createDevShell;
  };
}
