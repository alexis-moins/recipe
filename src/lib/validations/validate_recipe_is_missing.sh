validate_recipe_is_missing() {
    if [[ -f "${RECIPE_BOOK_DIR}/${1}" ]]; then
        error "recipe already exist: ${1}"
    fi
}
