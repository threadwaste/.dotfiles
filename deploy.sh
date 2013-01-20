#! /bin/bash

set -e

function usage() {
  echo "usage: `basename $0` <.dotfiles directory>"
}

function err() {
  echo "Error: `basename $0`: $1" >&2
}

# verify .dotfiles directory; get abspath
if [ -d "$1" ]; then
  df_dir=$(cd "$1"; pwd)
else
  err "$1 is not a directory" && exit 1
fi

# backup directory
bu=$df_dir/backup_`date +%s`
mkdir -v $bu

for i in `find $df_dir -maxdepth 1 -name ".*" ! -wholename $df_dir  ! -name ".git*"`
do
  # for all .dotfiles: move to $bu if exists; create symlink

  dotfile=`basename $i`
  if [ -e ~/$dotfile ]; then
    mv -v ~/$dotfile $bu
  fi
  ln -vs $i ~/$dotfile
done

# fin
echo "complete"
