ensure_recipe_book_setup

run_silent pushd "${RECIPE_BOOK_DIR}"
\fd --color=never --hidden .

run_silent popd
