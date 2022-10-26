#!/bin/sh

BASEDIR=$(dirname $0)

for x in $BASEDIR/home/*; do
    ln -s "$x" "$HOME/.$(basename $x)"
done

echo '{"RoslynExtensionsOptions":{"enableDecompilationSupport":true}}' > ~/.omnisharp/omnisharp.json
