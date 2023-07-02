clean_directory() {
    if [[ -d "${1}" ]] && [[ -z "$(ls -A "${1}")" ]]; then
        run_silent \rmdir "${1}"
    fi
}
