git_commit() {
    git -C "${RECIPE_BOOK_DIR}" commit -m "${1}"
}
