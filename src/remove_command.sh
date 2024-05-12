local recipe=${args['name']}

[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

local recipe_dir="$(dirname ${recipe})"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

# Directory in which the recipe will be stored
local destination_dir="${RECIPE_BOOK_DIR}/${recipe_dir}"

run_silent rm "${destination_path}"
clean_directory "${destination_dir}"

success "removed recipe ${recipe}"
