# LaTeX flake

A LaTeX template to get started writing LaTeX with nix support.

The main TODO for this flake is to build a document with the official University
of Vienna titlepage from a configuration. The shell contains pandoc, texlab and
texlab.combined.scheme-full, which is the complete installation of texlive. If
you want to use a smaller package-set you can use texlive.combined.scheme-small
and declare a custom texlive distribution. You can put simple latex style files
in `./texlivepkgs` which will be available during the build process. The texlive
aspects could really be improved upon.

The `document.nix` file contains a builder which runs the simple script
`./pfdlatex-builder.sh`. Support for more complex build systems is a high
priority. The list of arguments accounts for the data needed to generate the
titlepage, but these arguments are not used yet.
