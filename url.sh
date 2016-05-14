url_to_host() {
    dst="$1"; src="$2"

    # http://host.com:8080
    tmp="$(printf "$2" | cut -d/ -f3)"
    # host.com:8080
    [ -z "$tmp" ] && return 1
    tmp="${tmp%%:*}"
    # host.com

    eval "$dst=\"\$tmp\""

    return 0
}
