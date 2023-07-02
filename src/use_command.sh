local recipe="${args[name]}"
local destination="${args[--destination]}"

ensure_recipe_book_not_empty
[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

[[ -z "${destination}" ]] && destination="$(basename ${recipe})"

# TODO check if destination already exists
\cp -i "${RECIPE_BOOK_DIR}/${recipe}" "${destination}"

[[ -f "${destination}" ]] && \
    echo "$(green ✔) Your recipe is ready to use."
