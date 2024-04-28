local file="${args[file]}"
local recipe="${args[name]:-${file}}"

local edit="${args[--edit]}"
local force="${args[--force]}"

if [[ -f "${RECIPE_BOOK_DIR}/${recipe}" ]] && [[ -z "${force}" ]]; then
    error "Your recipe book already contains that recipe." && return 1
fi

local recipe_dir="$(dirname "${recipe}")"

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

# Directory in which the recipe will be stored
local destination_dir="${RECIPE_BOOK_DIR}/${recipe_dir}"

if [[ -d "${destination_dir}" ]]; then
    error "Your recipe book already contains that directory." && return 1
fi

# Create intermediary directories if needed
if [[ -n "${recipe_dir}" ]] && [[ ! -d "${destination_dir}" ]]; then
    command mkdir -p "${destination_dir}"
fi

[[ -n "${recipe}" ]] && command cp "${file}" "${destination_path}"

# Edit the file if the --edit flag was passed
[[ -n "${edit}" ]] && ${EDITOR} "${destination_path}"

if [[ -f "${destination_path}" ]]; then
    run_git add "${recipe}"
    git_commit "add recipe ${recipe}"

    info "New recipe added."
else
    clean_directory "${destination_dir}"
    error "Recipe import aborted."
fi
