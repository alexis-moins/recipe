local recipe="${args[name]}"
local pager="${args[--pager]}"

[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

command ${pager} "${destination_path}"
