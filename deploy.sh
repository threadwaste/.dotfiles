#! /bin/bash

set -e

dotfiles_dir=$(cd `dirname $0` && pwd)
backup_dir=~/backup_`date +%s`

mkdir -v $backup_dir

for repofile in `find $dotfiles_dir -maxdepth 1 -name ".*" \
    ! -wholename $dotfiles_dir \
    ! -name ".git" ! -name ".gitignore" ! -name ".gitmodules"`
do
    dotfile=`basename $repofile`
    if [ -e ~/$dotfile ]; then
        echo -n "moving: " && mv -v ~/$dotfile $backup_dir
    fi
    echo -n "linking: " && ln -vs $repofile ~/$dotfile
done
