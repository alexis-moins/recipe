validate_recipe_missing() {
    [[ ! -f "${RECIPE_BOOK_DIR:-${HOME}/recipe-book}/$1" ]] || echo "Your recipe book already contains that recipe."
}

