validate_recipe_exists() {
    [[ -f "${RECIPE_BOOK_DIR:-${HOME}/recipe-book}/$1" ]] || echo "must be an existing recipe"
}
