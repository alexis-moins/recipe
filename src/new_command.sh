echo "# this file is located in 'src/new_command.sh'"
echo "# code for 'recipe new' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args
local recipe="${args[name]}"

local recipe_dir="$(dirname ${recipe})"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

# Directory in which the recipe will be stored
local destination_dir="${RECIPE_BOOK_DIR}/${recipe_dir}"

# Create intermediary directories if needed
if [[ -n "${recipe_dir}" ]] && [[ ! -d "${destination_dir}" ]]; then
    \mkdir -p "${destination_dir}"
fi

${EDITOR} "${destination_path}"

if [[ -f "${destination_path}" ]]; then
    run_git add "${recipe}"
    git_commit "feat: added recipe '${recipe}'"

    echo "$(green ✔) New recipe added"
else
    clean_directory "${destination_dir}"
    echo "$(red x) Recipe creation aborted"
fi
