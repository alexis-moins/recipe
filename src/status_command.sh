local short="${args[--short]}"

if [[ -n "${short}" ]]; then
    run_git status --short
else
    run_git status
fi
