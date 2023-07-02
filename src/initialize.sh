if [[ ! -d "${RECIPE_BOOK_DIR}/.git" ]]; then
    run_silent \mkdir "$RECIPE_BOOK_DIR"
    run_silent pushd "$RECIPE_BOOK_DIR"

    run_silent git init
    run_silent popd

    echo "$(green ✔) Initialized recipe book."
fi
