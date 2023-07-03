# [[ ! -d "${RECIPE_BOOK_DIR}" ]] && \mkdir "${RECIPE_BOOK_DIR}"

# if [[ ! -d "${RECIPE_BOOK_DIR}/.git" ]]; then
#     run_silent pushd "$RECIPE_BOOK_DIR"

#     run_silent git init
#     run_silent popd

#     echo "$(green ✔) Initialized recipe book."
# fi

# if [[ ! -f "${RECIPE_BOOK_DIR}/.gitignore" ]] || ! grep '.templates' "${RECIPE_BOOK_DIR}/.gitignore"; then
#     echo ".templates/" >> "${RECIPE_BOOK_DIR}/.gitignore"

#     run_git add .gitignore
#     git_commit "feat: added .gitignore"

#     echo -e "$(green ✔) Added templates\n"
# fi

# [[ ! -d "${RECIPE_BOOK_DIR}/.templates" ]] && \mkdir "${RECIPE_BOOK_DIR}/.templates"
