validate_recipe_exists() {
    [[ -f "${RECIPE_BOOK_DIR}/$1" ]] || echo "must be an existing recipe"
}
