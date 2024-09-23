filter_recipe_book_not_empty() {
    if [[ -z "$(list_recipes)" ]]; then
        error "global recipe book is empty"
    fi
}
