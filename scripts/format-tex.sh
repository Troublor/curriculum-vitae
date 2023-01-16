#! /usr/bin/env bash

# this scripts formats tex files
#
DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT="$DIR/.."

OUT_DIR="$ROOT/.latexindent"
mkdir -p "$OUT_DIR"

if [ -z "$LATEXINDENT" ]; then
    LATEXINDENT=latexindent
fi

setopt extendedglob
for file in "$ROOT"/**/*.tex~"$ROOT"/template/**; do
    echo "Formatting $file..."
    "$LATEXINDENT" -s -l "$ROOT/.latexindent.yaml" -c "$OUT_DIR" -w $file
done
