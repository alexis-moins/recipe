local message="${args[message]}"

if [[ -n "${message}" ]]; then
    "${deps[git]}" -C "${DOTFILES_DIR}" commit -m "${message}"
else
    run_git commit
fi
