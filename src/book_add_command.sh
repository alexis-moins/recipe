local recipe_book="${args[recipe-book]}"
local repository="${args[repository]}"

local path="${RECIPE_DATA_DIR}/shelf/${recipe_book}"

if [[ -z "${repository}" ]]; then
    # If the repository is not provided, create a new recipe book
    command mkdir -p "${path}"
    command "${deps[git]}" -C "${path}" init

    success "added recipe book"
else
    # Otherwise, clone the repository
    command "${deps[git]}" clone "${repository}" "${path}"
    success "added remote recipe book"
fi
