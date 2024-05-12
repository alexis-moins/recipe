if [[ -n "${other_args[*]}" ]]; then
    run_git add ${other_args[*]} && success "staged ${other_args[*]}"
else
    candidates="$(run_git ls-files -mo --exclude-standard --full-name)"

    [[ -z "${candidates}" ]] && info "no changes to stage" && exit 0

    local files="$(echo "${candidates}" \
        | tr ' ' '\n' \
        | gum filter --no-limit --fuzzy --placeholder="Select files to stage" )"

    [[ -z "${files}" ]] && exit 0

    files="$(echo "${files}" | tr '\n' ' ')"

    run_git add ${files} \
        && success "staged ${files}"
fi
