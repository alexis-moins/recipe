local staged="${args[--staged]}"

if [[ -n "${staged}" ]]; then
    interactive_staged_diff
else
    interactive_diff
fi
