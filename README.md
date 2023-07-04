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

- bash 4.0 or higher
- [gum](https://github.com/charmbracelet/gum)
- [fd](https://github.com/sharkdp/fd)
- [rg](https://github.com/BurntSushi/ripgrep)
- git


## Installation

### Using recipe

```bash
# Clone the repository in the recommended location
git clone git@github.com:alexis-moins/recipe.git ~/.recipe

# Let recipe create the symbolic link for you!
cd ~/.recipe && ./recipe link
```

The last command creates a symbolic link to the `recipe` script in the `~/.local/bin/` directory. If you cloned the repository elsewhere, you may pass the repository path to the link command using the `-s | --source` flag. Likewise, you can also change the link destination path with the optional `path` argument!
```bash
./recipe link /usr/local/bin/ --source ~/scritps/recipe
```

### Manually

Clone the repository then move the [recipe](recipe) script to `~/.local/bin/` or anywhere in your `PATH`, and make it executable.

## Quick Start

After installing, you can follow these steps to quickly see how it works:

```bash
# First initialize a new recipe book
recipe init

# Or, if you already have a recipe book
recipe clone git@github.com:awesome-user/recipe-book

# You can add a recipe
recipe add docker/express-js --from Dockerfile

# View the list of your recipes
recipe list

# Check you recipe book at any time
recipe doctor

# Edit a recipe
recipe edit docker/express-js

# Even use a recipe in another project
recipe use docker/express-js --destination Dockerfile

# Optionally, you can add a remote repository to sync your recipe book across devices
recipe git remote add origin git@github.com:awesome-user/recipe-book
```

## Templates (wip)

A `template` is a recipe containing any number of special delimiter `{{ NAME }}`. Those delimiter enable you to write even more flexible recipes. Consider the following `docker/node` template file:
```Dockerfile
FROM node:{{ version }}

RUN {{ step }}
EXPOSE {{ port }}

CMD {{ command }}
```

When running `recipe use docker/node -d Dockerfile`, you will be asked for values to replace the variables `version`, `step`, `port` and `command`. Once you're done, the final recipe will be added to you local directory.

Note that the template workflow is subject to change!

## Usage

```
$ recipe

recipe - Store files/templates in a recipe book to use them anytime, anywhere

Usage:
  recipe COMMAND
  recipe [COMMAND] --help | -h
  recipe --version | -v

Commands:
  init     Create and setup a new recipe book
  doctor   Check your recipe book for potential problems
  add      Add a new recipe
  list     List all your recipes
  git      Access git from your recipe book
  use      Use a recipe locally
  remove   Remove a recipe
  edit     Edit a recipe
  clone    Clone a remote git repository
  link     Create a symbolic link to the recipe script
  show     Show the content of a recipe
  index    Build the template index

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
    Default: ~/recipe-book
```
