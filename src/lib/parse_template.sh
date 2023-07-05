parse_template() {
    local regex="\{\{[[:space:]]*([\w:+]+)[[:space:]]*\}\}"
    \rg -N --color=never --only-matching ${regex} --replace '$1' "${RECIPE_BOOK_DIR}/${1}" | tr '\n' ' '
}
