validate_recipe_book_exists() {
    if [[ ! -d "${RECIPE_DATA_DIR}/shelf/${1}" ]]; then
        error "recipe book not found: ${1}"
    fi
}
