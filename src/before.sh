local recipe_book="${args[--recipe-book]}"

# Override the RECIPE_BOOK and RECIPE_BOOK_DIR variable if the --recipe-book
# flag was passed.
if [[ -n "${recipe_book}" ]]; then
    # Name of the current recipe book
    export RECIPE_BOOK="${recipe_book}"

    # Path to the current recipe book
    export RECIPE_BOOK_DIR="${RECIPE_DATA_DIR}/shelf/${RECIPE_BOOK}"
fi
