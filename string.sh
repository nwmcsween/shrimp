if [ -z "$STRING_SH" ]; then
STRING_SH=1

str_to_sha1() {
  dst="$1"; src="$2"

  eval "$1=\"\$(printf \"%s\" \"\$2\" | sha1sum | cut -c1-7)\""

  return $?
}

str_ipush() {
  dst=$1; src=$2; sep=$3

  eval "test -z \$$dst" && sep=
 
  if eval "rx_match \"${sep}${src}|*${sep}${src}${sep}*|$src\" \"\${$dst}\""; then
    return 1
  fi

  eval "$dst=\"\$$dst\$sep\$src\""

  return 0
}

fi
