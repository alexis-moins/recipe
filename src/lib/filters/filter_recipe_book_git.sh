filter_recipe_book_git() {
    if [[ ! -d "${RECIPE_BOOK_DIR}/.git" ]]; then
        error "global recipe book is not a git repository"
    fi
}
