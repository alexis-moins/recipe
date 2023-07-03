local path="${args[path]}"

local source="${args[--source]}"
local remove="${args[--remove]}"
local copy="${args[--copy]}"

if [[ -n "${remove}" ]]; then
    if [[ -f "${path}/recipe" ]]; then
        run_silent rm -rf "${path}/recipe"
        echo "$(green ✔) Link removed from $(magenta "${path}")"
    else
        echo "No link found in $(magenta "${path}")"
        exit 1
    fi
else
    if [[ -f "${path}/recipe" ]]; then
        echo "There is already a link in $(magenta "${path}")"
        exit 1
    fi

    if [[ ! -d "${source}" ]]; then
        echo "Source directory $(magenta "${source}") does not exist"
        exit 1
    fi

    source=`realpath "${source}"`

    if [[ ! -f "${source}/recipe" ]]; then
        echo "Script 'recipe' not found in $(magenta "${source}")"
        exit 1
    fi

    local executable=`test -n "${copy}" && echo "cp" || echo "ln -s"`

    run_silent ${executable} "${source}/recipe" "${path}/recipe"
    echo "$(green ✔) Link created in $(magenta "${path}")"
fi
