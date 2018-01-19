if [ -z "$STRING_SH" ]; then
STRING_SH=1

str_to_sha1() {
  dst="$1"; src="$2"

  eval "$1=\"\$(printf \"%s\" \"\$2\" | sha1sum | cut -c1-7)\""

  return $?
}

fi
