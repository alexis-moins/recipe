local path="${args[path]}"

local source="${args[--source]}"
local remove="${args[--remove]}"

if [[ -n "${remove}" ]]; then
    if [[ -L "${path}/recipe" ]]; then
        run_silent \rm -rf "${path}/recipe"
        echo "$(green ✔) Link removed from $(magenta "${path}")"
    else
        echo "$(red error:) no link was found in $(magenta "${path}")"
        exit 1
    fi
else
    if [[ -L "${path}/recipe" ]]; then
        echo "$(red error:) there is already a link in $(magenta "${path}")"
        exit 1
    fi

    source=`test -z "${source}" && echo "${RECIPE_DIR}" || realpath "${source}"`

    if [[ ! -f "${source}/recipe" ]]; then
        echo "$(red error:) recipe script not found in $(magenta "${source}")"
        exit 1
    fi

    run_silent \ln -s "${source}/recipe" "${path}/recipe"
    echo "$(green ✔) Link created in $(magenta "${path}")"
fi
