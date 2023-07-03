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

if [[ ! -d "${RECIPE_BOOK_DIR}/.templates" ]]; then
    [[ -n "${error}" ]] && echo "" || error="yes"

    echo "$(yellow info:) your recipe book is missing the .templates directory"
    echo "$(yellow info:) consider running $(yellow_underlined mkdir ${RECIPE_BOOK_DIR}/.templates)"
fi

if [[ ! -f "${RECIPE_BOOK_DIR}/.gitignore" ]] || ! run_silent \rg -e '^\.templates[/]?$' "${RECIPE_BOOK_DIR}/.gitignore"; then
    [[ -n "${error}" ]] && echo "" || error="yes"

    echo "$(yellow info:) your recipe book should ignore the .templates directory"
    echo "$(yellow info:) consider adding a $(yellow_underlined .gitignore) file"
fi

if [[ -n "${error}" ]]; then
    return 1
fi
