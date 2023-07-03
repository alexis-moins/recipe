local recipe=${args['name']}
local auto_confirm=${args['--yes']}

ensure_recipe_book_not_empty
[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

local recipe_dir="$(dirname ${recipe})"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

# Directory in which the recipe will be stored
local destination_dir="${RECIPE_BOOK_DIR}/${recipe_dir}"

if [[ -n "${auto_confirm}" ]] || confirm "Remove recipe?"; then
    \rm "${destination_path}"

    clean_directory "${destination_dir}"

    run_git add "${recipe}"
    git_commit "feat: removed recipe '${recipe}'"

    echo "$(green ✔) Removed recipe ${recipe}"
fi
