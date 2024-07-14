#!/bin/sh

CHECK="all"

if [ "$#" -ne 0 ]; then
  CHECK="$1"
fi

if [[ "$CHECK" == "all" || "$CHECK" == "type" || "$CHECK" == "mypy" ]]; then
    echo "Pythonの型チェック中(mypy)..."
    poetry run mypy api tests
fi

if [[ "$CHECK" == "all" || "$CHECK" == "format" || "$CHECK" == "lint" || "$CHECK" == "black" ]]; then
    echo "Pythonコードスタイルのチェック中(black)..."
    poetry run black api tests --check --diff
fi

if [[ "$CHECK" == "all" || "$CHECK" == "format" || "$CHECK" == "lint" || "$CHECK" == "ruff" ]]; then
    echo "Pythonコードスタイルのチェック中(ruff)..."
    poetry run ruff check api tests
fi

if [[ "$CHECK" == "all"  || "$CHECK" == "lint" || "$CHECK" == "flake8" ]]; then
    echo "Pythonコードスタイルのチェック中(flake8)..."
    poetry run flake8 api tests
fi