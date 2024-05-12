local file="${args[file]}"
local recipe="${args[name]:-$(basename "${file}")}"

local edit="${args[--edit]}"
local force="${args[--force]}"

if [[ -f "${RECIPE_BOOK_DIR}/${recipe}" ]] && [[ -z "${force}" ]]; then
    error "your recipe book already contains that recipe" && exit 1
fi

# Full destination path to the recipe
local destination_path="${RECIPE_BOOK_DIR}/${recipe}"

if [[ "${recipe}" = */* ]]; then
    local recipe_dir="$(dirname "${recipe}")"

    # Directory in which the recipe will be stored
    local destination_dir="${RECIPE_BOOK_DIR}/${recipe_dir}"

    # Create intermediary directories if needed
    if [[ ! -d "${destination_dir}" ]]; then
        command mkdir -p "${destination_dir}"
    fi
fi

command cp "${file}" "${destination_path}"

# Edit the file if the --edit flag was passed
[[ -n "${edit}" ]] && command "${EDITOR}" "${destination_path}"

if [[ -f "${destination_path}" ]]; then
    success "new recipe added"
else
    clean_directory "${destination_dir}"
    error "recipe not added"
    exit 1
fi
