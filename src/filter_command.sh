local recipes="$(find_recipe)"

echo "${recipes}" | gum filter --placeholder "Select a recipe..."
