find_recipe() {
    run_silent pushd "${RECIPE_BOOK_DIR}"
    local recipes="$(\fd --color never --hidden --type file .)"

    run_silent popd
    echo "${recipes}"
}
