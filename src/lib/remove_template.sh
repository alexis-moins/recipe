remove_template() {
    if [[ -f "${RECIPE_BOOK_DIR}/.templates" ]] && \rg "${1}:" "${RECIPE_BOOK_DIR}/.templates" > /dev/null; then
        local templates=`rg -v "${1}:" "${RECIPE_BOOK_DIR}/.templates"`

        echo "${templates}" > "${RECIPE_BOOK_DIR}/.templates"
        run_git add "${RECIPE_BOOK_DIR}/.templates"
    fi
}
