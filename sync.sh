#! /bin/bash

set -x

cd $(dirname "${0}")

rsync_options=(-av --relative --recursive --itemize-changes)

src="homedir/./"
tgt="${HOME}"

while getopts "uw" arg; do
  case "${arg}" in
    w)
      rsync_options+=(--exclude=Brewfile.personal)
      ;;
    u)
      t=$(mktemp)
      find homedir -type f | cut -d/ -f2- > $t
      
      rsync_options+=(--update --existing --files-from=${t})

      src="${HOME}/./"
      tgt="homedir"

      ;;
    *)
      echo "usage: $(basename ${0}) [-u] [-w]"
      exit 1
      ;;
  esac
done

rsync "${rsync_options[@]}" "${src}" "${tgt}"
