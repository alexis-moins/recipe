local recipe="${args[recipe]}"
local destination="${args[destination]}"

local edit="${args[--edit]}"
local force="${args[--force]}"

if [[ -z "${recipe}" ]]; then
    recipe="$(filter_recipe)"

    [[ -z "${recipe}" ]] && exit 1
fi

if [[ -z "${destination}" ]]; then
    placeholder="$(basename "${recipe}")"

    destination="$(command "${deps[gum]}" input --placeholder="recipe=${recipe}" --width=0 --prompt="◉ Destination: " --no-show-help)"

    [[ -z "${destination}" ]] && exit 1
fi

if [[ -f "${destination}" ]] && [[ -z "${force}" ]]; then
    error "recipe would overwrite ${destination}"
    exit 1
fi

destination_dir="$(dirname "${destination}")"

if [[ ! "${destination_dir}" == '.' ]] && [[ ! -d "${destination_dir}" ]]; then
    command mkdir -p "${destination_dir}"
fi

command cp -f "${RECIPE_BOOK_DIR}/${recipe}" "${destination}"
success "recipe ${destination} is ready to use"

[[ -n "${edit}" ]] && command "${EDITOR}" "${destination}"
