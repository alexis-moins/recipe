local auto_confirm="${args[--yes]}"

if [[ -d "${RECIPE_BOOK_DIR}" ]]; then
    if [[ -n "${auto_confirm}" ]] || confirm "Overwrite current recipe book [$(magenta ${RECIPE_BOOK_DIR})] ?"; then
        \rm -rf "${RECIPE_BOOK_DIR}"
    else
        exit 1
    fi
fi

command mkdir "${RECIPE_BOOK_DIR}"

run_silent pushd "${RECIPE_BOOK_DIR}"
run_silent git init

info "Created your recipe book."
run_silent popd
