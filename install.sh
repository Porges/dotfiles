#!/bin/sh

for x in home/*; do
    ln -s "$HOME/.$x" "$x"
done
