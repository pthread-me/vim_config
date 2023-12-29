#!/bin/bash

echo "checking for old configs and deleting them"
test -f ~/.vimrc && rm ~/.vimrc
test -f ~/.vim && rm -r ~/.vim

echo "copying new files"
cp -r .vimrc .vim ../
echo "done"
