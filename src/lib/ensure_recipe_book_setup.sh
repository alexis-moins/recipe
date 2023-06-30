ensure_recipe_book_setup() {
    if [[ ! -d "${RECIPE_BOOK_DIR}/.git" ]]; then
        echo "Your recipe book is not initialized."
        echo "Run $(blue recipe init) first."
        exit 1
    fi
}
