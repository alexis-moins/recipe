interactive_diff() {
    candidates="$(run_git ls-files -mo --exclude-standard --full-name )"
    [[ -z "${candidates}" ]] && info 'no changes to diff' && return 0

    local files="$(echo "${candidates}" | gum filter --placeholder="Select files to diff" --no-limit)"
    [[ -z "${files}" ]] && return 0

    run_git diff "${files}"
}

