{pkgs ? import <nixpkgs> {}, config, shellcommands}:
with pkgs;
  mkShell {
    buildInputs = shellcommands;
    shellHook = ''
      unset PS1
      export PS1="nix-shell:${config.document_title}> "
      echo writing .latexmkrc ...
      echo "${LATEXMKRC}" > .latexmkrc
      echo done
      echo "Welcome! Happy typing!"
    '';
  }
