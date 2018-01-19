if [ -z "$PATH_SH" ]; then
PATH_SH=1

path_resolve() {
	dst="$1"; src="$2"

	eval "$dst=\"\$(ls -l \$src | awk '{ printf \$NF }')\"" && return 0

	return 1
}

path_real() {
	src="$1"

	cd $(dirname \"$src\")
	printf "%s" "$(pwd)/$(basename \"$src\")"
	cd -
}

fi
