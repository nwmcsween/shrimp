#!/bin/sh

path_absolute() {
  printf "%s" "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

path_relative() {
  dst="$(cd $(dirname $1); pwd -P)"; src="$(cd $(dirname $1); pwd -P)"
  up=

  while [ "${dst#$src/}" = "$dst" ]; do
    src=$(dirname "$src")
    up="../$up"
  done

  printf "%s" "$up${dst#$src}/"
}
