local recipe="${args[recipe]}"
local destination="${args[destination]}"

if [[ -z "${destination}" ]]; then
    destination="$(basename "${recipe}")"
fi

if [[ -f "${destination}" ]]; then
    error "recipe would overwrite ${destination}"
    exit 1
fi

destination_dir="$(dirname "${destination}")"

if [[ ! "${destination_dir}" == '.' ]] && [[ ! -d "${destination_dir}" ]]; then
    command mkdir -p "${destination_dir}"
fi

command cp -f "${RECIPE_BOOK_DIR}/${recipe}" "${destination}"
success "recipe ${destination} is ready to use"
