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

recurse() {
 for i in "$1"/*;do
    if [ -d "$i" ];then
        recurse "$i"
    elif [ -f "$i" ]; then
        if [[ "$i" == *.tex ]]; then
            echo "Formatting $i"
            "$LATEXINDENT" -s -l "$ROOT/.latexindent.yaml" -c "$OUT_DIR" -w $file
        fi
    fi
    fi
 done
}
recurse
