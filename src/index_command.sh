local update="${args[--update]}"
local simulate="${args[--simulate]}"

local templates="$(find_templates)"

# Checking that index contains existing templates
for template in $templates; do
    name=`echo ${template} | cut -f 1 -d ':'`

    if [[ -f "${RECIPE_BOOK_DIR}/${name}" ]]; then
        if [[ -n "${update}" ]]; then
            echo "$(blue [update]) ${name}"
            [[ -z "${simulate}" ]] && remove_template "${name}" && add_template "${name}"
        else
            echo "[      ] ${name}"
        fi
    else
        echo "$(red [remove]) ${name}"
        [[ -z "${simulate}" ]] && remove_template "${name}"
    fi
done

# Checking that the index is not missing a template
for recipe in $(find_recipe); do
    local variables=`parse_template "${recipe}"`

    if [[ -n "${variables}" ]] && [[ ${templates} != *"${recipe}"* ]]; then
        echo "$(green "[insert]") ${recipe}"

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
    echo "$(green ✔) Template index up to date"
fi
