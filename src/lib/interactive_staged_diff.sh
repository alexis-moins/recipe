interactive_staged_diff() {
    candidates="$(run_git diff --cached --name-only)"
    [[ -z "${candidates}" ]] && info 'no staged changes to diff' && return 0

    local files="$(echo "${candidates}" | gum filter --placeholder="Select files to diff" --no-limit)"
    [[ -z "${files}" ]] && return 0

    run_git diff --staged "${files}"
}

