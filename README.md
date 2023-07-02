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

![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)

</div>

---

`recipe` is a bash script allowing users to manage a git repository (called a `recipe book`) of files commonly used across different projects or directories (called `recipes`). You could, for instance, add generic Dockerfile or docker-compose.yaml files to your recipe book to easily bootstrap new docker projects.

## Prerequisites

- bash 4.0 or higher (`brew install bash` on mac).
- [gum](https://github.com/charmbracelet/gum)
- [fd](https://github.com/sharkdp/fd)
- git


## Installation

### Using recipe

Clone the repository in the default location `~/.recipe`. Then, `cd` into the directory and run the following command:
```bash
./recipe link
```

This command creates a symbolic link to the `recipe` script in the `~/.local/bin` directory. If you cloned the repository elsewhere, you may pass the repository path to the link command using the `--source` flag. Likewise, you can also change the link destination path with the optional `path` argument!
```bash
./recipe link /usr/local/bin --source ~/scritps/recipe
```

### Manually

Clone the repository then move the [recipe](recipe) script to `/usr/local/bin/` or anywhere in your `PATH`, and make it executable.

## Quick Start

After installing, you can follow these steps to quickly see how it works:

```bash
# Add a recipe
recipe add docker/express-js --from Dockerfile

# View list of recipes
recipe list

# Use a recipe in another project
recipe use docker/express-js --destination Dockerfile

# Optionaly, you can add a remote repository to sync your recipe book across devices
recipe git remote add origin git@github.com:awesome-user/recipe-book

# Or, if you already have a recipe book
recipe clone git@github.com:awesome-user/recipe-book
```

## Usage

```
$ recipe

recipe - Store files/templates in a recipe book to use them anytime, anywhere

Usage:
  recipe COMMAND
  recipe [COMMAND] --help | -h
  recipe --version | -v

Commands:
  add      Add a new recipe
  list     List all your recipes
  git      Access git from your recipe book
  use      Use a recipe localy
  remove   Remove a recipe
  edit     Edit a recipe
  clone    Clone a remote git repository
  link     Create a symbolic link to the recipe executable

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
    Directories used to store recipes
    Default: /Users/alexis/recipe-book

  RECIPE_SOURCE_DIR
    Directories containing the source repository
    Default: /Users/alexis/.recipe
```
