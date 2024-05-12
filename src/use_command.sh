local recipe="${args[recipe]}"
local destination="${args[destination]:-$(basename "${recipe}")}"

local edit="${args[--edit]}"
local force="${args[--force]}"

if [[ -z "${recipe}" ]]; then
    recipe="$(filter_recipe)"

    [[ -z "${recipe}" ]] && exit 0
    destination="$(basename "${recipe}")"
fi

if [[ -f "${destination}" ]] && [[ -z "${force}" ]]; then
    error "recipe would overwrite ${destination}"
    exit 1
fi

command cp -f "${RECIPE_BOOK_DIR}/${recipe}" "${destination}"
success "recipe ${recipe} is ready to use"

[[ -n "${edit}" ]] && command "${EDITOR}" "${destination}"
