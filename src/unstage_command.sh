candidates="$(run_git diff --cached --name-only)"

[[ -z "${candidates}" ]] && info "no changes to unstage" && return 0

local files="$(echo "${candidates}" \
    | tr ' ' '\n' \
    | gum filter --no-limit --fuzzy --placeholder="Select files to unstage" )"

[[ -z "${files}" ]] && return 0

files="$(echo "${files}" | tr '\n' ' ')"

run_git restore --staged ${files}  && success "unstaged ${files}"
