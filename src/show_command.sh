local recipe="${args[name]}"
local command="${args[--exec]}"

[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

command ${command} "${destination_path}"
