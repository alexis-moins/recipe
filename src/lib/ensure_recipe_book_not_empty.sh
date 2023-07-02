ensure_recipe_book_not_empty() {
    local candidates="$(find_recipe)"

    if [[ -z "${candidates}" ]]; then
        echo "Your recipe book is empty"
        exit 1
    fi
}
