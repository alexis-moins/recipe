local templates="${args[--templates]}"

if [[ -z "${templates}" ]]; then
    find_recipe
elif [[ -f "${RECIPE_BOOK_DIR}/.templates" ]]; then
    \rg -N --color=never --only-matching '([\w/]+):' --replace '$1' "${RECIPE_BOOK_DIR}/.templates"
fi
