#! /bin/bash

set -e

function err() {
  echo "Error: `basename $0`: $1" >&2
}

df_dir=$(cd `dirname $0` && pwd)
bu_dir=$df_dir/backup_`date +%s`
mkdir -v $bu_dir

for i in `find $df_dir -maxdepth 1 -name ".*" ! -wholename $df_dir  ! -name ".git*"`
do
  # for all .dotfiles: move to $bu_dir if exists; create symlink

  dotfile=`basename $i`
  if [ -e ~/$dotfile ]; then
    mv -v ~/$dotfile $bu_dir
  fi
  ln -vs $i ~/$dotfile
done

# fin
echo "complete"
