local url="${args[url]}"
local auto_confirm="${args[--yes]}"

if [[ ! -d "${RECIPE_BOOK_DIR}" ]] || [[ -n "${auto_confirm}" ]] || confirm "Overwrite current recipe book?"; then
    [[ -d "${RECIPE_BOOK_DIR}" ]] && \rm -rf "${RECIPE_BOOK_DIR}"

    git clone "${url}" "${RECIPE_BOOK_DIR}"
    echo "$(green ✔) Your recipe book is ready"
fi
