
<div align='center'>

![Version](https://img.shields.io/badge/version-1.6.0-blue.svg)

</div>

`recipe` is a bash script allowing users to manage a git repository (called a `recipe book`) of files commonly used across different projects or directories (called `recipes`). You could, for instance, add generic Dockerfile or docker-compose.yaml files to your recipe book to easily bootstrap new docker projects.

## Prerequisites

- bash 4.0 or higher
- [gum](https://github.com/charmbracelet/gum)
- git


## 🧰 Installation

### Using recipe

Clone the repository in the recommended location
```bash
git clone git@github.com:alexis-moins/recipe.git ~/.recipe
```

Go into the install directory and execute the [install](install) script:
```bash
./install
```

The last command creates a symbolic link to the `recipe` script in the `~/.local/bin/` directory (you can also change the link destination path by passing it as an argument to the install script).

> If you did not clone the repository in `~/.recipe`, don't forget to set the `RECIPE_INSTALL_DIR` environment variable globally afterwards!

### Manually

Clone the repository then move the [recipe](recipe) script to anywhere in your `PATH`, and ensure it is executable!

## 🌱 Quick Start

After installing, you can follow these steps to quickly see how it works:

```bash
# First initialize a new recipe book
recipe init

# Or, if you already have a recipe book
recipe init git@github.com:<username>/recipe-book.git

# You can add a recipe
recipe add Dockerfile docker/express-js

# View the list of your recipes
recipe list

# Edit a recipe
recipe edit docker/express-js

# Even use a recipe in another project
recipe use docker/express-js Dockerfile
```

## 🥘 Misc

### Multiple recipe books

If you want to use multiple recipe book, you can always create aliases in your shell.
```bash
alias school-book='RECIPE_BOOK_DIR="${HOME}/school" recipe'
```

And call the recipe book this way:
```bash
school-book use notes/biology
```

## 🚦 Usage

```
$ recipe

recipe - store redundant files in a recipe book to use them anytime, anywhere

Usage:
  recipe COMMAND
  recipe [COMMAND] --help | -h
  recipe --version | -v

Commands:
  help      Show help about a command
  link      Create a link to the recipe script
  unlink    Remove the link to the recipe script
  update    Update recipe to the latest version
  env       Show environment information

Recipe Book Commands:
  init      Initialize a recipe book or clone one
  cd        Navigate to your recipe book in a new shell

Recipe Commands:
  add       Add a new recipe
  list      List all your recipes
  use       Use a recipe locally
  remove    Remove a recipe
  edit      Edit a recipe
  show      Show the content of a recipe
  filter    Interactively filter recipes

Git Commands:
  sync      Update your recipe book
  status    Show the status of your recipe book
  stage     Stage files
  unstage   Unstage files
  restore   Restore unstaged files (undo changes)
  diff      Show diff with last commit
  idiff     Show interactive diff with last commit
  commit    Commit changes

Options:
  --help, -h
    Show this help

  --version, -v
    Show version number

Environment Variables:
  EDITOR
    Editor used for interactive commands
    Default: vim

  RECIPE_BOOK_DIR
    Directory used to store recipes
    Default: ~/recipe-book

  RECIPE_INSTALL_DIR
    Directory where the reporitory was cloned
    Default: ~/.recipe

  RECIPE_SHOW_CMD
    Command used to show reciped
    Default: cat
```
