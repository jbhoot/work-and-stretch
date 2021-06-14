{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    ocaml
    dune_2
    ocamlPackages.utop
    mpv
  ];
}
