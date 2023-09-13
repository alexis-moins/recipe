if [[ ! -d "${HOME}/.recipe" ]]; then
    echo "No ~/.recipe directory. Check documentation for installation instruction."
    exit 1
fi

git -C "${HOME}/.recipe" pull
