local recipe="${args[name]}"
local destination="${args[--destination]}"

ensure_recipe_book_not_empty
[[ -z "${recipe}" ]] && recipe="$(filter_recipe)"

[[ -z "${destination}" ]] && destination="$(basename ${recipe})"

if [[ ! -f "${destination}" ]] || confirm "Overwrite ${destination}?"; then
    local templates=`rg --only-matching "\{\{(.*)\}\}" --replace '$1' "${RECIPE_BOOK_DIR}/${recipe}"`

    if [[ -z "${templates}" ]]; then
        \cp -f "${RECIPE_BOOK_DIR}/${recipe}" "${destination}"
        echo "$(green ✔) Your recipe is ready to use."
    else
        local expression=""

        for template in ${templates}; do
            [[ -n "${expression}" ]] && expression+=";"
            local response=`gum input --prompt "${template}: " --placeholder "something"`

            [[ -z "${response}" ]] && exit 1

            echo "${template}: $(cyan ${response})"

            expression+="s/{{ ${template} }}/${response}/"
        done

        sed "${expression}" "${RECIPE_BOOK_DIR}/${recipe}" > "${destination}"
        echo -e "\n$(green ✔) Your recipe is ready to use."
    fi
fi
