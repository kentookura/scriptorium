# LaTeX template

To use this template, run `nix flake init -t github:kentookura/scriptorium`. The
shell contains a full tex distribution, a language server and pandoc,
Run `nix flake show` to see the outputs:

```
├───devShells
│   └───x86_64-linux:
│       └───default: development environment 'nix-shell'
└───packages
    └───x86_64-linux:
        └───default: package 'Nix_LaTeX_Template'
```

Running `nix build` will produce `result/main.pdf`.

## Misc

You can put simple latex style files in `./texlivepkgs` which will be available during the build process. The texlive aspects could really be improved upon.

TODO:
- [ ] Official University titlepage from configuration.
- [ ] The `document.nix` file contains a builder which runs the simple script `./pfdlatex-builder.sh`. Support for more complex build systems is a high priority. The list of arguments accounts for the data needed to generate the titlepage, but these arguments are not used yet.
