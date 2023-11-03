find_recipe() {
    run_silent pushd "${RECIPE_BOOK_DIR}"
    local recipes=`\fd --exclude '.gitignore' --color=never --hidden --type=f`

    run_silent popd
    if [[ -n "${recipes}" ]]; then
        echo "${recipes}"
    fi
}
