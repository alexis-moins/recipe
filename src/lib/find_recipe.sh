find_recipe() {
    local recipes=$(run_git "ls-files")

    if [[ -n "${recipes}" ]]; then
        echo "${recipes}"
    fi
}
