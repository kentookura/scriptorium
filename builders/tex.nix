pkgs: attrs:
  with pkgs;
  let defaultAttrs = {
    builder = "${latexrun}/bin/latexrun";
    args = [ ./buildTex.sh ];
    baseInputs = [latexrun texDistribution];
    buildInputs = [];
    system = currentSystem;
  };
  in
  derivation (defaultAttrs // attrs)
