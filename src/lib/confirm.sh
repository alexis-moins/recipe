confirm() {
    local response=`gum choose --header "${1}" --header.foreground="7" --cursor.foreground="2" "yes" "no"`
    [[ "${response}" == "yes" ]] && return 0 || return 1
}
