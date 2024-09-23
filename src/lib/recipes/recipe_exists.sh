recipe_exists() {
    if [[ -f "${RECIPE_BOOK_DIR}/${1}" ]]; then
        return 0
    else
        return 1
    fi
}
