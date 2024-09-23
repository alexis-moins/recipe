# Define data dir here rather than in bashly.yaml to prevent users from
# changing it.
export RECIPE_DATA_DIR="${HOME}/.local/share/recipe"

dirs=(
    "${RECIPE_DATA_DIR}/shelf"
)

#
# Create directories if not present
#
for destination in ${dirs[*]}; do
    if [[ ! -d "${destination}" ]]; then
        command mkdir -p "${destination}"
    fi
done

if [[ -f ".recipe-book" ]]; then
    # File used to store the name of the current recipe book
    export RECIPE_BOOK_INDEX=".recipe-book"
else
    # File used to store the name of the current recipe book
    export RECIPE_BOOK_INDEX="${RECIPE_DATA_DIR}/global-recipe-book"

    if [[ ! -f "${RECIPE_BOOK_INDEX}" ]]; then
        touch "${RECIPE_BOOK_INDEX}"
    fi
fi


# Name of the current recipe book
export RECIPE_BOOK="$(cat "${RECIPE_BOOK_INDEX}")"

# Path to the current recipe book
export RECIPE_BOOK_DIR="${RECIPE_DATA_DIR}/shelf/${RECIPE_BOOK}"
