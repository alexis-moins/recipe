local recipe_book="${args[recipe-book]}"

echo "${recipe_book}" > "${RECIPE_BOOK_INDEX}"
success "set global recipe book"
