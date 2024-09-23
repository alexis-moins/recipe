candidates="$(run_git ls-files -mo --exclude-standard --full-name)"

[[ -z "${candidates}" ]] && info "no changes to stage" && exit 0

local files="$(pipe "${candidates}" \
    | gum filter --no-limit --fuzzy --placeholder="Select files to stage" )"

[[ -z "${files}" ]] && exit 0

files="$(join "${files}")"

run_git add ${files} && success "staged ${files}"
