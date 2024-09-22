#!/usr/bin/env bash
#
# Uninstall script
#
set -e

WHITE="\e[0m"
GREEN="\e[32;1m"

destination="${1:-"${HOME}/.local/bin"}"

./recipe uninstall-hook

if [[ -f "${destination}/recipe" ]]; then
    command rm "${destination}/recipe"
fi

echo -e "${GREEN}✓${WHITE} recipe has been removed"
