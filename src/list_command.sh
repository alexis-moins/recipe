local templates="${args[--templates]}"

if [[ -z "${templates}" ]]; then
    find_recipe
else
    find_templates
fi
