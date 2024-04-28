filter_recipe_book_healthy() {
    if ! recipe_doctor_command &> /dev/null; then
        warn "Your recipe book is not correctly setup."
        warn "Consider running $(yellow_underlined recipe doctor)."
        echo " "
    fi
}

filter_recipe_book_not_empty() {
    if [[ -z "$(find_recipe)" ]]; then
        error "Your recipe book is empty."
        echo " "
    fi
}
