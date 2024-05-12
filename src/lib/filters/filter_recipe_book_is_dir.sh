filter_recipe_book_is_dir() {
    if [[ ! -d "${RECIPE_BOOK_DIR}" ]]; then
        error "your recipe book is missing at \$RECIPE_BOOK_DIR"
        error "consider using $(red_underlined "recipe init")"
    fi
}

