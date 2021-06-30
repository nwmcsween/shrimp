#!/bin/sh

cc_is_pp() {
  pp=$1; file=$2; cc=${3:-${CC:-cc}}

  ! type "$cc" > /dev/null 2>&1 && printf "%s\n" "\$1 with value $cc not found" >&2 && return 2
  [ ! -f "$file" ] && printf "%s\n" "\$2 with value $file doesn't exist" >&2 && return 3

  printf "typedef int x;\n#if !%s\n#error yes\n#endif\n" "$pp" > "$file"
  $cc -c -o /dev/null "$file" > /dev/null 2>&1 || return 1

  return 0
}

cc_is_ldflag() {
  flag=$1; file=$2; cc=${3:-${CC:-cc}}

  ! type "$cc" > /dev/null 2>&1 && printf "%s\n" "\$1 with value $cc not found" >&2 && exit 1
  [ ! -f "$file" ] && printf "%s\n" "\$2 with value $file doesn't exist" >&2 && exit 1

  printf "typedef int x;\n" > "$file"
  $cc "$file" -c -o /dev/null "-nostdlib -shared $flag" > /dev/null 2>&1
}

cc_is_flag() {
  flag=$1; file=$2; cc=${3:-${CC:-cc}}

  ! type "$cc" > /dev/null 2>&1 && printf "%s\n" "\$1 with value $cc not found" >&2 && exit 1
  [ ! -f "$file" ] && printf "%s\n" "\$2 with value $file doesn't exist" >&2 && exit 1

  printf "typedef int x;\n" > "$file"
  $cc "$file" -c -o /dev/null "$flag" > /dev/null 2>&1
}
