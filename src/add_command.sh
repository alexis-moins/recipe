local file="${args[file]}"
local recipe="${args[name]:-$(basename "${file}")}"

if recipe_exists "${recipe}"; then
    error "recipe already exists: ${recipe}"
    exit 1
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
success "added recipe: ${recipe}"
