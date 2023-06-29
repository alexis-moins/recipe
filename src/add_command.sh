echo "# this file is located in 'src/add_command.sh'"
echo "# code for 'recipe add' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

destination=${args['name']}
file=${args['--file']}

function copy_recipe() {
    \cp ${1} ${2} && echo "New recipe added!"
}

[[ -f $destination ]] && echo "There is already a recipe with that name." && exit 1

[[ -n ${file} ]] && copy_recipe ${file} ${destination} || $EDITOR ${destination}
