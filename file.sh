#!/bin/sh

fl_tmp() {
  suffix=; quiet=0
  file=; dir="/tmp"; tries=100

  usage=$(cat <<'EOF'
Usage: $0 [OPTION]... [DIR]
  Create a temporaray file in [DIR:-/tmp]
    -q,           supress stderr output
    -s SUFFUX,    append suffix SUFFIX
EOF
)

  while [ $# -gt 0 ]; do
    case "$1" in
      -s) [ "$2" ] && suffix=$2 && shift || echo "$usage";;
      -q) quiet=1;;
      -h) printf "%s\n" "$usage" && exit 0;;
      --) shift && break;;
      *) break;;
    esac
    shift
  done

  [ "$1" ] && dir="$1"

  if [ "$suffix" ]; then
    printf "%s" "$suffix" | grep -q '^\.' || suffix=".$suffix"
  fi

  if [ ! -d "$dir" ]; then
    [ "$quiet" -ne 1 ] && printf "%s\n" "\$1 with value $dir isn't a valid directory" 1>&2
    return 2
  fi

  set -C
  i=0
  while [ $((i = i + 1)) -le "$tries" ]; do
    file="${dir}/tmp-$$-$PPID-$i${suffix}"
    [ ! -f "$file" ] && touch "$file" > /dev/null 1>&2 && break
  done
  set +C
  [ "$i" -gt "$tries" ] && return 1

  printf "%s\n" "$file"
  return 0
}
