filter_recipe_book_ready() {
    if ! recipe_doctor_command &> /dev/null; then
        echo "$(yellow info:) your recipe book is not ready yet"
        echo "$(yellow info:) consider running $(yellow_underlined recipe doctor)"
    fi
}
