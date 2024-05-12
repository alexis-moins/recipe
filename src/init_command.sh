local force="${args[--force]}"
local repository="${args[repository]}"

if [[ -d "${RECIPE_BOOK_DIR}" ]]; then
    if [[ -z "${force}" ]]; then
        error "\$RECIPE_BOOK_DIR is not empty"
        exit 1
    else
        command rm -rf "${RECIPE_BOOK_DIR}"
    fi
fi

if [[ -n "${repository}" ]]; then
    command "${deps[git]}" clone "${repository}" "${RECIPE_BOOK_DIR}"
    success "cloned remote recipe book"
else
    command mkdir -p "${RECIPE_BOOK_DIR}"
    run_git init

    success "initialized empty recipe book"
fi

