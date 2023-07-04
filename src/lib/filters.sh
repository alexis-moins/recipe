filter_recipe_book_healthy() {
    if ! recipe_doctor_command &> /dev/null; then
        echo "$(yellow info:) your recipe book is not correctly setup"
        echo "$(yellow info:) consider running $(yellow_underlined recipe doctor)"
    fi
}

filter_recipe_book_not_empty() {
    if [[ -z "$(find_recipe)" ]]; then
        echo "Your recipe book is empty"
    fi
}
