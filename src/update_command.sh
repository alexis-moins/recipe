if [[ ! -d "${RECIPE_INSTALL_DIR}" ]]; then
    echo "No recipe install directory. Check documentation for installation instruction."
    exit 1
fi

git -C "${RECIPE_INSTALL_DIR}" pull
