confirm() {
    local response=`gum input --prompt "${1} $(green "(yes/no [no])") " --placeholder "type a valid option"`
    [[ "${response}" == "yes" ]] && return 0 || return 1
}
