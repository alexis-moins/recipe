<div align='center'>

```
                _            
               (_)           
  _ __ ___  ___ _ _ __   ___ 
 | '__/ _ \/ __| | '_ \ / _ \
 | | |  __/ (__| | |_) |  __/
 |_|  \___|\___|_| .__/ \___|
                 | |         
                 |_|         
```

![Version](https://img.shields.io/badge/version-0.9.5-blue.svg)

</div>

---

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

Go into the install directory and let recipe take care of the rest!
```bash
RECIPE_INSTALL_DIR=$(pwd) ./recipe link
```

The last command creates a symbolic link to the `recipe` script in the `~/.local/bin/` directory (you can also change the link destination path). Finally, if you did not clone the repository in `~/.recipe`, run the don't forget to set the `RECIPE_INSTALL_DIR` environment variable globally afterwards!

### Manually

Clone the repository then move the [recipe](recipe) script to anywhere in your `PATH`, and ensure it is executable!

## 🌱 Quick Start

After installing, you can follow these steps to quickly see how it works:

```bash
# First initialize a new recipe book
recipe init

# Or, if you already have a recipe book
recipe clone git@github.com:awesome-user/recipe-book

# You can add a recipe
recipe add Dockerfile docker/express-js

# View the list of your recipes
recipe list

# Check you recipe book at any time
recipe doctor

# Edit a recipe
recipe edit docker/express-js

# Even use a recipe in another project
recipe use docker/express-js Dockerfile

# Optionally, you can add a remote repository to sync your recipe book across devices
recipe git remote add origin git@github.com:awesome-user/recipe-book
```

## 📦 Multiple recipe books

If you want to use multiple recipe book, you can always create aliases in your shell.
```bash
alias school-book='RECIPE_BOOK_DIR="${HOME}/school" recipe'
```

And call the recipe book this way:
```bash
school-book use javascript/singleton
```

## 🚦 Usage

```
$ recipe

recipe - Store redundant files in a recipe book to use them anytime, anywhere

Usage:
  recipe COMMAND
  recipe [COMMAND] --help | -h
  recipe --version | -v

Recipe Book Commands:
  init     Create and setup a new recipe book
  doctor   Check your recipe book for potential problems
  git      Access git from your recipe book
  clone    Clone a remote git repository
  dir      Show recipe book directory

Recipe Commands:
  add      Add a new recipe
  list     List all your recipes
  use      Use a recipe locally
  remove   Remove a recipe
  edit     Edit a recipe
  show     Show the content of a recipe
  filter   Interactively filter recipes

Commands:
  link          Create a link to the recipe script
  unlink        Remove the link to the recipe script
  update        Update recipe to the latest version
  completions   Command line completions
  env           Show recipe environment variables
  shell         Start an interactive shell

Options:
  --help, -h
    Show this help

  --version, -v
    Show version number

Environment Variables:
  EDITOR
    Editor to use for interactive commands
    Default: vim

  RECIPE_BOOK_DIR
    Directory used to store recipes
    Default: ~/recipe-book

  RECIPE_INSTALL_DIR
    Directory in which recipe was cloned
    Default: ~/.recipe
```
