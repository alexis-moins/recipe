for recipe_book in $(ls "${RECIPE_DATA_DIR}/shelf"); do
    if [[ "${recipe_book}" = "${RECIPE_BOOK}" ]]; then
        echo "$(green "*") ${recipe_book}"
    else
        echo "${recipe_book}"
    fi
done
