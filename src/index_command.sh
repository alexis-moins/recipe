local simulate="${args[--simulate]}"

if [[ -z "${simulate}" ]]; then
    \rm -f "${RECIPE_BOOK_DIR}/.templates"
else
    echo "=> Actions that would be performed:"
fi

for recipe in $(find_recipe); do
    local variables=`parse_template "${RECIPE_BOOK_DIR}/${recipe}"`

    if [[ -n "${variables}" ]]; then
        echo "Adding recipe $(blue_underlined ${recipe}) to the index"

        if [[ -z "${simulate}" ]]; then
            echo "${recipe}: ${variables::-1}" >> "${RECIPE_BOOK_DIR}/.templates"
            run_git add ".templates"
        fi
    fi
done

local has_changed=`run_git status | \rg '.templates'`

if [[ -z "${simulate}" ]] && [[ -n "${has_changed}" ]]; then
    run_git add ".templates"
    git_commit "feat: added template index"
fi

if [[ -z "${simulate}" ]]; then
    echo "$(green ✔) Template index in sync"
fi
