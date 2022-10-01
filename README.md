# Scriptorium 

![](./assets/Escribano.jpg)

(/skrɪpˈtɔːriəm/), is commonly used to refer to a room in medieval European monestaries devoted to the writing, copying and illuminating of manuscripts commonly handled by the monastic scribes

This project provides an immutable environment for managing digital documents.
At the moment the main features are a template for a nix flake which compiles a
latex document and a development shell with basic tools for compiling tex and
using various npm packages. More to come.

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
this directory.

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
