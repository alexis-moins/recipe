local recipe="${args[recipe]}"
local destination="${args[destination]}"
local edit="${args[--edit]}"

[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

if [[ -z "${destination}" ]]; then
    destination=`gum input --placeholder "recipe name..." --value "$(basename ${recipe})" --prompt "$(blue ◉) Recipe name: "`

    [[ -z "${destination}" ]] && exit 1
fi

if [[ ! -f "${destination}" ]] || confirm "Overwrite local ${destination} file?"; then
    command cp -f "${RECIPE_BOOK_DIR}/${recipe}" "${destination}"
    info "Recipe ${recipe} is ready to use."

    [[ -n "${edit}" ]] && $EDITOR "${destination}"
fi
