validate_recipe_exists() {
    if ! recipe_exists "${1}"; then
        error "recipe not found: ${1}"
    fi
}
