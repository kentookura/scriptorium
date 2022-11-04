{
  pkgs,
  system,
  inputs,
}: {
  tex = let
    texlive = pkgs.texlive;
  in
    texlive.combine {
      inherit
        (texlive)
        scheme-medium
        filecontents
        pmboxdraw
        etoolbox
        relsize
        showexpl
        varwidth
        ;
    };
}
