local url="${args[url]}"
local auto_confirm="${args[--yes]}"

if [[ -n "${auto_confirm}" ]] || "${deps[gum]}" confirm "Overwrite current recipe book?"; then
    run_silent rm -rf "${RECIPE_BOOK_DIR}"
    git clone "${url}" "${RECIPE_BOOK_DIR}"

    echo "$(green ✔) Your recipe book is ready"
fi
