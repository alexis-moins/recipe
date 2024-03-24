local shell="${args[shell]:-${SHELL}}"

run_silent pushd "${RECIPE_BOOK_DIR}"
exec "${shell}"
