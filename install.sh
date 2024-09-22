#!/usr/bin/env bash
#
# Install script
#
set -e

WHITE="\e[0m"
GREEN="\e[32;1m"

destination="${1:-"${HOME}/.local/bin"}"

./recipe install-hook

if [[ ! -f "${destination}/recipe" ]]; then
    command cp -i recope "${destination}/recipe"
fi

echo -e "${GREEN}✓${WHITE} recipe is ready to use"
