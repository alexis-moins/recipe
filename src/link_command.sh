local path="${args[path]}"
local copy="${args[--copy]}"

local source="${RECIPE_INSTALL_DIR}"

if [[ -f "${path}/recipe" ]]; then
    echo "There is already a link in $(magenta "${path}")"
    exit 1
fi

if [[ ! -d "${source}" ]]; then
    echo "Source directory $(magenta "${source}") does not exist"
    exit 1
fi

if [[ ! -f "${source}/recipe" ]]; then
    echo "Script 'recipe' not found in $(magenta "${source}")"
    exit 1
fi

local executable=`test -n "${copy}" && echo "cp" || echo "ln -s"`

command ${executable} "${source}/recipe" "${path}/recipe"
echo "$(green ✔) Link created in $(magenta "${path}")"
