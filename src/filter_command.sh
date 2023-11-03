local value=${args['value']}

local recipes="$(find_recipe)"

if [[ -n "${value}" ]]; then
    echo "${recipes}" | \rg $value --color=never
else
    echo "${recipes}" | gum filter --placeholder "Select a recipe..."
fi
