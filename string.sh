str_to_hash() {
    dst="$1"; src="$2"

    eval "$1=\"\$(printf \"\$2\" | sha1sum | cut -c1-7)\""

    return $?
}
