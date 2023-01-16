#! /usr/bin/env zsh

# this scripts formats tex files

DIR=${0:a:h}
ROOT="$DIR/.."

OUT_DIR="$ROOT/.latexindent"
mkdir -p "$OUT_DIR"

setopt extendedglob
for file in "$ROOT"/**/*.tex~"$ROOT"/template/**; do
    echo "Formatting $file..."
    latexindent -s -l "$ROOT/.latexindent.yaml" -c "$OUT_DIR" -w $file
done
