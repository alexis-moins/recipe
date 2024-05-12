filter_recipe_book_is_git() {
    if [[ ! -d "${RECIPE_BOOK_DIR}/.git" ]]; then
        error "your recipe book is not a git repository"
        error "consider using $(yellow_underlined "recipe init")"
    fi
}

