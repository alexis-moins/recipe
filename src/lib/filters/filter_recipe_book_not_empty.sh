filter_recipe_book_not_empty() {
    if [[ -z "$(find_recipe)" ]]; then
        error "your recipe book is empty"
    fi
}
