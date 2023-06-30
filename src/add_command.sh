inspect_args

destination=${args['name']}
file=${args['--file']}

if [[ -n ${file} ]]; then
    \cp ${file} "${RECIPE_BOOK_DIR}/${destination}"
    echo "$(green ✔) New recipe added."
else
    ${EDITOR} "${RECIPE_BOOK_DIR}/${destination}"

    [[ -f "${RECIPE_BOOK_DIR}/${destination}" ]] && \
        echo "$(green ✔) New recipe added." || \
        echo "The recipe was not added to your recipe book."
fi
