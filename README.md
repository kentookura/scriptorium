# Scriptorium 

![](./assets/Escribano.jpg)

(/skrɪpˈtɔːriəm/), is commonly used to refer to a room in medieval European monestaries devoted to the writing, copying and illuminating of manuscripts commonly handled by the monastic scribes

This project provides an immutable environment for managing digital documents.

### Features

- template for a latex document 
- development shell with pandoc, a texlive distribution, a latex language server
  and some other stuff, see `shell.nix`.
- a relatively developed neovim configuration (my personal one) for editing
  markdown and latex
- vscodium with some nix and latex extensions installed

I plan on working on making this available for more platforms other than linux
but I have other priorities.

## How to use

Install [direnv](https://direnv.net) and [nix](https://nixos.org/). After [enabling nix flakes](https://nixos.wiki/wiki/flakes) you can initialise a latex document by navigating to a new directory and running
```
  nix flake init -t github:kentookura/scriptorium#default
```
Run
```
  direnv allow
```
to enable direnv to automatically enter the development shell when you change to
this directory. This command will probably take a while to finish when running
for the first time. After it completes, my neovim config and vscodium will be
available when you change to this directory. Try running `codium`. Getting an
emacs config into here would be cool.

Entering
```
  nix flake show
```
will show you the two outputs of the template. A development shell and a package. The
`devShells` output defines the environment which direnv loads. The package
`default` is a simple latex document which you can compile by running 
```
  nix flake build
```
after which the pdf will be available in the `result` folder.

## TODO
enable cachix for faster build times
