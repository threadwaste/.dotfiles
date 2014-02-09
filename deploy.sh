#! /bin/bash

set -e

dotfiles_dir=$(cd `dirname $0` && pwd)
backup_dir=$HOME/backup-`date +%s`

mkdir -v $backup_dir

for repofile in `find $dotfiles_dir -maxdepth 1 ! -wholename $dotfiles_dir \
    ! -name .git ! -name .gitignore ! -name .gitmodules \
    ! -name deploy.sh ! -name README.textile`
do
    dotfile=`basename $repofile`
    if [ -e $HOME/$dotfile ]; then
        echo -n "moving: " && mv -v $HOME/$dotfile $backup_dir
    fi
    echo -n "linking: " && ln -vs $repofile $HOME/$dotfile
done
