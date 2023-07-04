local recipe="${args[name]}"
local destination="${args[--destination]}"

[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

[[ -z "${destination}" ]] && destination="$(basename ${recipe})"

if [[ ! -f "${destination}" ]] || confirm "Overwrite ${destination}?"; then
    local variables=`rg -N "${recipe}:" "${RECIPE_BOOK_DIR}/.templates"`

    if [[ -z "${variables}" ]]; then
        \cp -f "${RECIPE_BOOK_DIR}/${recipe}" "${destination}"
    else
        local expression=""

        for template in ${variables/${recipe}: /}; do
            [[ -n "${expression}" ]] && expression+=";"
            local response=`gum input --prompt "${template}: " --placeholder "something"`

            [[ -z "${response}" ]] && exit 1

            echo "${template}: $(cyan ${response})"

            expression+="s/{{ ${template} }}/${response}/"
        done

        sed "${expression}" "${RECIPE_BOOK_DIR}/${recipe}" > "${destination}"
        echo ""
    fi

    echo "$(green ✔) Your recipe is ready to use"
fi
