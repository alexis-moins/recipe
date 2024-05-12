local path="${args[path]}"

if [[ -f "${path}/recipe" ]]; then
    run_silent rm -rf "${path}/recipe"
    success "link removed from ${path}"
else
    error "no link found in ${path}"
    exit 1
fi
