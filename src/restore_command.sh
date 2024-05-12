if [[ -n "${other_args[*]}" ]]; then
    run_git restore ${other_args[*]} && success "restored ${other_args[*]}"
else
    candidates="$(run_git ls-files -mo --exclude-standard --full-name)"

    [[ -z "${candidates}" ]] && info "no changes to restore" && exit 0

    local files="$(echo "${candidates}" \
        | tr ' ' '\n' \
        | gum filter --no-limit --fuzzy --placeholder="Files to restore...")"

    [[ -z "${files}" ]] && exit 0

    files="$(echo "${files}" | tr '\n' ' ')"

    run_git restore ${files} && success "restored ${files}"
fi
