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

if [[ -n "${error}" ]]; then
    return 1
else
    echo "$(green ✔) Your recipe book is correctly setup"
fi
