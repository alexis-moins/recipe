run_git() {
    command "${deps[git]}" -C "${RECIPE_BOOK_DIR}" ${@}
}
