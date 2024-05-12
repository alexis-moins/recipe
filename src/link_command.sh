local path="${args[path]}"
local copy="${args[--copy]}"

local source="${RECIPE_INSTALL_DIR}"

if [[ -f "${path}/recipe" ]]; then
    error "there is already a link in ${path}"
    exit 1
fi

if [[ ! -d "${source}" ]]; then
    error "source directory ${source} does not exist"
    exit 1
fi

if [[ ! -f "${source}/recipe" ]]; then
    error "script 'recipe' not found in ${source}"
    exit 1
fi

local executable=`test -n "${copy}" && echo "cp" || echo "ln -s"`

command ${executable} "${source}/recipe" "${path}/recipe"
success "link created in ${path}"
