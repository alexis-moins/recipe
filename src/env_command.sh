local variable="${args[variable]}"

if [[ -n "${variable}" ]]; then
    echo "${!variable}"
else
    echo "RECIPE_INSTALL_DIR=${RECIPE_INSTALL_DIR}"
    echo "RECIPE_BOOK_DIR=${RECIPE_BOOK_DIR}"
    echo "RECIPE_SHOW_CMD=${RECIPE_SHOW_CMD}"
fi
