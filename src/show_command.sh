local recipe="${args[name]}"

ensure_recipe_book_not_empty
[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

command ${RECIPE_SHOW_COMMAND} "${destination_path}"
