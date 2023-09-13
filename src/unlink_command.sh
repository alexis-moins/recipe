local path="${args[path]}"

if [[ -f "${path}/recipe" ]]; then
    run_silent rm -rf "${path}/recipe"
    echo "$(green ✔) Link removed from $(magenta "${path}")"
else
    echo "No link found in $(magenta "${path}")"
    exit 1
fi
