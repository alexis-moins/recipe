local url="${args[url]}"
local auto_confirm="${args[--yes]}"

if [[ ! -d "${RECIPE_BOOK_DIR}" ]] || [[ -n "${auto_confirm}" ]] || confirm "Overwrite current recipe book [$(magenta ${RECIPE_BOOK_DIR})] ?"; then
    [[ -d "${RECIPE_BOOK_DIR}" ]] && command rm -rf "${RECIPE_BOOK_DIR}"

    git clone "${url}" "${RECIPE_BOOK_DIR}"
    info "Your recipe book is ready."
fi
