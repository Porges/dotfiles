#!/bin/sh

for x in home/*; do
    ln -s "$x" "$HOME/.$x"
done
