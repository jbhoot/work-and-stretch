{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
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
