local file="${args[file]}"

local recipe="${args[name]:-${file}}"
local edit="${args[--edit]}"

[[ -f "${RECIPE_BOOK_DIR}/${recipe}" ]] && echo "$(red error:) Your recipe book already contains that recipe." && return 1

local recipe_dir="$(dirname ${recipe})"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

# Directory in which the recipe will be stored
local destination_dir="${RECIPE_BOOK_DIR}/${recipe_dir}"

# Create intermediary directories if needed
if [[ -n "${recipe_dir}" ]] && [[ ! -d "${destination_dir}" ]]; then
    \mkdir -p "${destination_dir}"
fi

[[ -n "${recipe}" ]] && \cp ${file} "${destination_path}"

# Edit the file if the --edit flag was passed
[[ -n "${edit}" ]] && ${EDITOR} "${destination_path}"

if [[ -f "${destination_path}" ]]; then
    run_git add "${recipe}"
    git_commit "feat: added recipe '${recipe}'"

    echo "$(green ✔) New recipe added"
else
    clean_directory "${destination_dir}"
    echo "$(red x) Recipe import aborted"
fi
