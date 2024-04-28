if [[ ! -d "${RECIPE_INSTALL_DIR}" ]]; then
    warn "No recipe install directory."
    warn "Check documentation for installation instruction."
    exit 1
fi

git -C "${RECIPE_INSTALL_DIR}" pull
