find_templates() {
    if [[ -f "${RECIPE_BOOK_DIR}/.templates" ]]; then
        \rg -N --color=never --only-matching '([\w/\.-]+):' --replace '$1' "${RECIPE_BOOK_DIR}/.templates"
    fi
}
