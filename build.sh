#!/bin/bash

echo "checking for old configs and deleting them"
rm -f ~/.vimrc
rm -rf ~/.vim

echo "copying new files"
cp -r .vimrc .vim ~/
echo "done"
