local auto_confirm="${args[--yes]}"

if [[ -d "${RECIPE_BOOK_DIR}" ]]; then 
    if [[ -n "${auto_confirm}" ]] || confirm "Overwrite current recipe book ?"; then
        \rm -rf "${RECIPE_BOOK_DIR}"
    else
        exit 1
    fi
fi

\mkdir "${RECIPE_BOOK_DIR}"

run_silent pushd "${RECIPE_BOOK_DIR}"
run_silent git init

echo -e "$(green ✔) Initialized empty recipe book"

run_silent popd
