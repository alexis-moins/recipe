#!/usr/bin/env bash
#
# Install script
#
set -e

WHITE="\e[0m"
GREEN="\e[32;1m"

destination="${1:-"${HOME}/.local/bin"}"

if [[ ! -f "${destination}/recipe" ]]; then
    command cp -i recipe "${destination}/recipe"
fi

echo -e "${GREEN}✓${WHITE} recipe is ready to use"
