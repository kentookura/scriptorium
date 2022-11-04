# Scriptorium

The goal of this project are:

- create a reliable software environment for managing digital documents
- provide tools that universities can use to provide materials and
  infrastructure for students

## Features

- Reproducible environments for writing documents

Running `nix flake show` will display the outputs of this project in a nice
manner.

## Editing experience

I eventually want to wrap `nix flake init -t` in a script that interfaces with a
neovim plugin.

## Getting set up

Install [direnv](https://direnv.net) and [nix](https://nixos.org/). After [enabling nix flakes](https://nixos.wiki/wiki/flakes) you can initialise a latex document by navigating to a new directory and running

```
  nix flake init -t github:kentookura/scriptorium#default
```

or any other available template.
Run

```
  direnv allow
```

to enable direnv to automatically enter the development shell when you change to this directory. This command will probably take a while to finish when running for the first time. After it completes, my neovim config and vscodium will be available when you change to this directory. Try running `codium`. Getting an emacs config into here would be cool.

Entering

```
  nix flake show
```

will show you the two outputs of the template. A development shell and a package. The `devShells` output defines the environment which direnv loads. The package `default` is a simple latex document which you can compile by running

```
  nix flake build
```

after which the pdf will be available in the `result` folder.

# Design goals:

Teacher:

```{course.doc}
Date, Time, Location

Intro
---
Exercises:
  Week 1:
    Notes,
    [a,b,c]
  ...
---
Lecture Notes:
  "export pdf"
```

```{cli}
uni push course
# open course in server, useful for developing the document
uni view course
```

Student:

```
# this populates a todo list. Configuring hooks would be sick
uni pull course

# this sets up the studying environment. Hook into WM. Start local note
# server
uni work course
# maybe use tags here:
uni study topic
```

The indexing of the notes should happen completely automatically. I am
looking into pair-programming plugins for neovim. Making study-rooms
that allow for collaborating with a computer that is not just another
video conferencing app. It should be trivial to share notes with other
students. It should be easy to create scratch buffers, to save them and to view
them in a browser. I want to combine zathura and browser in tabs to create a
unified reading experience
