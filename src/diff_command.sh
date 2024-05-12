local files="${other_args[*]}"
local staged="${args[--staged]}"

if [[ -n "${files}" ]]; then
    if [[ -n "${staged}" ]]; then
        run_git diff --staged ${files}
    else
        run_git diff ${files}
    fi
else
    if [[ -z "${staged}" ]]; then
        run_git diff
    else
        run_git diff --staged
    fi
fi
