if [ "$PROC_SH" ]; then
PROC_SH=1

proc_abort() {
  args="$*"

  printf "%s\n" "$args"
  exit 1
}

fi
