filter_recipe_book_directory() {
    if [[ -z "${RECIPE_BOOK}" ]]; then
        error "global recipe book not set"
    elif [[ ! -d "${RECIPE_BOOK_DIR}" ]]; then
        error "global recipe book not found: ${RECIPE_BOOK}"
    fi
}
