find_recipe() {
    local recipes=$( run_git ls-files --others --cached --modified)

    if [[ -n "${recipes}" ]]; then
        echo "${recipes}"
    fi
}
