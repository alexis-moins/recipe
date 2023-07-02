local recipe="${args[name]}"
local command="${args[--command]:-${RECIPE_SHOW_COMMAND}}"

[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

command ${command} "${destination_path}"
