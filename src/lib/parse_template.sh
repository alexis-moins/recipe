parse_template() {
    local regex="\{\{[[:space:]]*([\w:+]+)[[:space:]]*\}\}"
    \rg -N --color=never --only-matching ${regex} --replace '$1' "${1}" | tr '\n' ' '
}
