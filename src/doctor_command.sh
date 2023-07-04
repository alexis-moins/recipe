local error=""

if [[ ! -d "${RECIPE_BOOK_DIR}" ]]; then
    echo "$(yellow info:) your recipe book is missing at ${RECIPE_BOOK_DIR}"
    echo "$(yellow info:) consider running $(yellow_underlined recipe init)"

    error="yes"
fi

if [[ ! -d "${RECIPE_BOOK_DIR}/.git" ]]; then
    [[ -n "${error}" ]] && echo "" || error="yes"

    echo "$(yellow info:) your recipe book is not a git repository"
    echo "$(yellow info:) consider running $(yellow_underlined recipe init)"
fi

if [[ -f "${RECIPE_BOOK_DIR}/.templates" ]]; then
    local templates=`\rg -N --color=never --only-matching '([\w/]+):' --replace '$1' "${RECIPE_BOOK_DIR}/.templates"`

    for template in ${templates}; do
        if [[ ! -f "${RECIPE_BOOK_DIR}/${template}" ]]; then
            [[ -n "${error}" ]] && echo "" || error="yes"

            echo "$(yellow info:) your template index is not in sync with your recipe book"
            echo "$(yellow info:) consider running $(yellow_underlined recipe index --simulate)"

            break
        fi
    done
fi

if [[ -n "${error}" ]]; then
    return 1
else
    echo "Your recipe book is correctly setup"
fi
