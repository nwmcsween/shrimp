file_tmp() {
  src=$1; dir=$2; ext=$3

  set -C
  i=0

  while [ "$i" -le 50 ]; do i=$((i + 1))
    if eval "$src=\"\${dir}/tmp-\$\$-\$PPID-\$i.\$ext\" 2>|\
       /dev/null > \"\${dir}/tmp-\$\$-\$PPID-\$i.\$ext\""; then
      i=0
      break
    fi
  done

  set +C
  trap 'rm "$src"' EXIT INT QUIT TERM HUP

  test "$i" -eq 0 && return 0 || return 1
}
