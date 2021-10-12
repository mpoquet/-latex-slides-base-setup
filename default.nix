{ pkgs ? import (
    fetchTarball "https://github.com/NixOS/nixpkgs/archive/21.11.tar.gz") {}
}:

let
  self = rec {
    # build the slides from scratch
    # no build cache helps in making your slides reproducible
    slides = pkgs.stdenv.mkDerivation rec {
      name = "report";
      nativeBuildInputs = with pkgs; [
        texlive.combined.scheme-full
        ninja
        pandoc
        asymptote
      ];
      # source filtering ensures build ignores local cache files
      src = pkgs.lib.sourceByRegex ./. [
        ".*\.md"
        ".*\.bib"
        ".*\.sty"
        "build\.ninja"
        "fig"
        "fig/.*\.asy"
      ];
      installPhase = ''
        mkdir -p $out
        mv slides.pdf $out/
      '';
    };

    # convenient for interactive development.
    # slides will be regenerated whenever one of its input files is changed.
    # the killall command updates the llpp pdf renderer, customize it to your needs.
    autorebuild-shell = pkgs.mkShell rec {
      name = "autobuild-shell";
      buildInputs = [
        pkgs.entr pkgs.psmisc
      ] ++ slides.nativeBuildInputs;
      shellHook = ''
        ls build.ninja *.md *.sty *.bib fig/*.asy | entr -s "ninja ; killall -HUP --regexp '(.*bin/)?llpp'"
      '';
    };
  };
in
  self
