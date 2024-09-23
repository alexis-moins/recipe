validate_recipe_book_is_missing() {
    if [[ -d "${RECIPE_DATA_DIR}/shelf/${1}" ]]; then
        error "recipe book already exist: ${1}"
    fi
}
