#!/usr/bin/bash

# script parameter and constant
poetry_src=$1
poetry_web_uri="https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py"

# initialize bash environment
source $HOME/.bash_init

# parameterize downloading get-poetry.py or assuming it is locally available.
if [[ $poetry_src == "web" ]]; then
    curl -sSL $poetry_web_uri | python
else
    if [[ $poetry_src == "local" ]]; then
        python /get-poetry.py
    else
        echo "Invalid poetry source: $poetry_src"
        exit 1
    fi
fi

source $HOME/.poetry/env
poetry self:update
