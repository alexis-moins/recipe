local path="${args[path]}"

if [[ -f "${path}/recipe" ]]; then
    run_silent rm -rf "${path}/recipe"
    info "Link removed from ${path}."
else
    error "No link found in ${path}."
    exit 1
fi
