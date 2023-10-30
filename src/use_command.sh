local recipe="${args[recipe]}"
local destination="${args[destination]}"
local edit="${args[--edit]}"

[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

[[ -z "${destination}" ]] && destination="$(basename ${recipe})"

if [[ ! -f "${destination}" ]] || confirm "Overwrite ${destination}?"; then
    \cp -f "${RECIPE_BOOK_DIR}/${recipe}" "${destination}"
    echo "$(green ✔) Your recipe is ready to use"

    [[ -n "${edit}" ]] && $EDITOR "${destination}"
fi
