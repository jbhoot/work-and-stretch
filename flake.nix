{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/1f06456eabe9f768f87a26d3ff8b2dc14eb4046d";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in
      {
        devShell.${system} = pkgs.mkShell {
          buildInputs = with pkgs; [
            ocaml
            ocamlPackages.findlib
            dune_2
            ocamlPackages.ocaml-lsp
            ocamlformat
            ocamlPackages.utop

            ocamlPackages.re

            mpv
          ];
        };
      };
}
