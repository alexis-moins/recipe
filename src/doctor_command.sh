local error=""

if [[ ! -d "${RECIPE_BOOK_DIR}" ]]; then
    warn "Your recipe book is missing at ${RECIPE_BOOK_DIR}."
    warn "Consider running $(yellow_underlined recipe init)."

    error="yes"
fi

if [[ ! -d "${RECIPE_BOOK_DIR}/.git" ]]; then
    [[ -n "${error}" ]] && echo "" || error="yes"

    warn "Your recipe book is not a git repository."
    warn "Consider running $(yellow_underlined recipe init)."
fi

if [[ -n "${error}" ]]; then
    return 1
else
    info "Your recipe book is correctly setup."
fi
