if [[ ! -d "${RECIPE_INSTALL_DIR}" ]]; then
    echo "No recipe directory. Check documentation for installation instruction."
    exit 1
fi

run_git pull
