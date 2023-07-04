find_recipe() {
    run_silent pushd "${RECIPE_BOOK_DIR}"
    local recipes=`\fd --exclude '.gitignore' --exclude '.templates' -c 'never' -H -t f`

    run_silent popd
    if [[ -n "${recipes}" ]]; then
        echo "${recipes}"
    fi
}
