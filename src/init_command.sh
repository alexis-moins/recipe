echo "# this file is located in 'src/init_command.sh'"
echo "# code for 'recipe init' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

recipe_book="${RECIPE_BOOK_DIR:-${HOME}/recipe-book}"

function run_silent() {
    ${@} 1> /dev/null
}

[[ -d ${recipe_book} ]] && echo "You already have a recipe book!" && exit 1

\mkdir "$recipe_book"

run_silent pushd "$recipe_book"
run_silent git init

run_silent popd
echo "Your recipe book has been created!"
