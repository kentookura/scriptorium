{
  pkgs,
  system,
  inputs,
}: {
  tex = let
    texlive = pkgs.texlive;
    makeTLpkg = style: {
      pkgs = [
        (
          pkgs.stdenv.mkDerivation {
            name = style;
            pname = style;
            src = ./texlivepkgs/${style}.sty;
            phases = ["installPhase"];
            installPhase = ''
              mkdir -p $out/tex/${style}
              cp $src $out/tex/${style}
            '';
            tlType = "run";
          }
        )
      ];
    };
    operators = makeTLpkg "operators";
    quiver = makeTLpkg "quiver";
    preamble = makeTLpkg "preamble";
  in
    texlive.combine {
      inherit
        (texlive)
        tikz-cd
        scheme-small
        etoolbox
        import
        latex-bin
        memoir
        platex-tools
        biblatex
        amsfonts
        amsmath
        amstex
        titlesec
        hyperref
        hycolor
        geometry
        nth
        mathtools
        extpfeil
        lipsum
        floatrow
        caption
        titling
        pgfplots
        asymptote
        bussproofs
        ;
      inherit
        operators
        quiver
        preamble
        ;
    };
}
