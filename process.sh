#!/bin/sh

pr_dosh() {
  file=; retries=3; quiet=0
  n=0

  usage=$(cat <<'EOF'
Usage: $0 [OPTION]... [FILES]
  Run shell scripts in [FILES]
    -q,           supress stderr output
    -r RETRIES,   number of retries per file to run (default $retries)
EOF
)

  while [ $# -gt 0 ]; do
    case "$1" in
      -r)
        if [ -n "$2" ]; then
          retries="$2"
          shift
        else
          echo "$usage"
        fi
      ;;
      -q) quiet=1;;
      -h) printf "%s\n" "$usage" && exit 0;;
      --) shift && break;;
      *) break;;
    esac
    shift
  done

  for file in "$@"; do
    printf "Running %s\n" "$file"
    [ ! -f "$file" ] && [ "$quiet" -ne 0 ] && printf "Argument %s isn't a file\n" "$file" 2>&1
    while ! ( trap - INT QUIT TSTP; . $file ) && [ $((n = n + 1)) -le "$retries" ]; do
      if [ "$quiet" -eq 0 ]; then
        printf "Failed to run %s: %s/%s times\n" "$file" "$n" "$retries" 2>&1
      fi
    done
    [ "$n" -gt "$retries" ] && printf "Failed to %s\n" "$file" && return 2
  done

  return 0
}
