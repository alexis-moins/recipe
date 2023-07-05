add_template() {
    local variables=`parse_template "${1}"`

    if [[ -n "${variables}" ]]; then
        echo "${1}: ${variables::-1}" >> "${RECIPE_BOOK_DIR}/.templates"
        run_git add ".templates"
    fi
}
