local url="${args[url]}"
local auto_confirm="${args[--yes]}"

if [[ ! -d "${RECIPE_BOOK_DIR}" ]] || [[ -n "${auto_confirm}" ]] || confirm "Overwrite current recipe book [$(magenta ${RECIPE_BOOK_DIR})] ?"; then
    [[ -d "${RECIPE_BOOK_DIR}" ]] && \rm -rf "${RECIPE_BOOK_DIR}"

    git clone "${url}" "${RECIPE_BOOK_DIR}"
    run_git switch -c `date "+%Y%m%d%H%m%S"`

    echo "$(green ✔) Your recipe book is ready"
fi
