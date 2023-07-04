local recipe="${args[name]}"

local file="${args[--from]}"
local edit="${args[--edit]}"

local template="${args[--template]}"

local recipe_dir="$(dirname ${recipe})"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

# Directory in which the recipe will be stored
local destination_dir="${RECIPE_BOOK_DIR}/${recipe_dir}"

# Create intermediary directories if needed
if [[ -n "${recipe_dir}" ]] && [[ ! -d "${destination_dir}" ]]; then
    \mkdir "${destination_dir}"
fi

[[ -n "${file}" ]] && \cp ${file} "${destination_path}"

# Edit the file if no --from flags was passed or if the --edit flag was passed
[[ -z "${file}" ]] || [[ -n "${edit}" ]] && ${EDITOR} "${destination_path}"

if [[ -f "${destination_path}" ]]; then
    run_git add "${recipe}"
    git_commit "feat: added recipe '${recipe}'"

    echo "$(green ✔) New recipe added"
else
    clean_directory "${destination_dir}"
fi
