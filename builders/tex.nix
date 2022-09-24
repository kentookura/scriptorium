pkgs: attrs:
  with pkgs;
  let defaultAttrs = {
    builder = "${latexrun}/bin/latexrun";
    args = [ ./buildTex ];
    baseInputs = [latexrun texDistribution];
    buildInputs = [];
    system = buitlins.currentSystem;
  };
  derivation (defaultAttrs // attrs)
