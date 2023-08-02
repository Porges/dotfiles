#!/bin/sh

BASEDIR=$(dirname $(realpath "${BASH_SOURCE:-$0}"))

for x in $BASEDIR/home/*; do
    ln -s "$x" "$HOME/.$(basename $x)"
done

mkdir -p ~/.omnisharp/
echo '{"RoslynExtensionsOptions":{"enableDecompilationSupport":true}}' > ~/.omnisharp/omnisharp.json
