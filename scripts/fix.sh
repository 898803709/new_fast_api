#!/bin/bash -eu
# コードスタイルの自動修正を行います

cd "$( dirname "$0" )"/..
poetry run ruff check --fix-only api
poetry run black api