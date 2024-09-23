
<div align='center'>

![Version](https://img.shields.io/badge/version-1.7.1-blue.svg)

</div>

`recipe` is a bash script allowing users to manage a collection of git repositories (called a `recipe books`) of files commonly used across different projects or directories (called `recipes`). You could, for instance, add generic Dockerfile or docker-compose.yaml files to your recipe book to easily bootstrap new docker projects.

## Prerequisites

- bash 4.0 or higher
- [gum](https://github.com/charmbracelet/gum)
- git


## 🧰 Installation

Clone the repository
```bash
git clone git@github.com:alexis-moins/recipe.git ~/.recipe
```

Go into the install directory and execute the [install](install.sh) script:
```bash
./install.sh
```

The install script copies the `recipe` script in the `~/.local/bin` directory (you can also change the destination by passing it as an argument to the install script).

## 🌱 Quick Start

After installing, you can follow these steps to quickly see how it works:

```bash
# First initialize a new recipe book
recipe book add personal

# Or, if you already have a recipe book
recipe book add personal git@github.com:alexis-moins/recipe-book.git

# Set the recipe book as the global one
recipe book global personal

# You can now add a recipe
recipe add Dockerfile docker/express-js

# View the list of your recipes
recipe list

# Edit a recipe
recipe edit docker/express-js

# Even use a recipe in another project
recipe use docker/express-js Dockerfile
```

## 🚦 Usage

```
$ recipe

recipe - store redundant files in a recipe book to use them anytime, anywhere

Usage:
  recipe COMMAND
  recipe [COMMAND] --help | -h
  recipe --version | -v

Recipe Commands:
  add       Add a new recipe
  list      List all your recipes
  filter    Filter recipes
  use       Use a recipe locally
  remove    Remove a recipe
  edit      Edit a recipe
  show      Show the content of a recipe

Commands:
  env       Print environment information
  book      List, filter, and add recipe books

Git Commands:
  status    Show the status of your recipe book
  stage     Stage files interactively
  unstage   Unstage files interactively
  restore   Restore unstaged files interactively
  diff      Show interactive diff with last commit
  commit    Commit changes
  git       Run git commands within your recipe book

Recipe Book Commands:
  cd        Navigate to your recipe book in a new shell

Options:
  --recipe-book, -b RECIPE_BOOK
    Name of the recipe book

  --help, -h
    Show this help

  --version, -v
    Show version number

Environment Variables:
  RECIPE_SHOW_CMD
    Command used to show recipes
    Default: cat
```
