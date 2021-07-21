{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
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
}
