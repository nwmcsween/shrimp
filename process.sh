proc_abort() {
  args="$*"

  printf "%s\n" "$args"
  exit 1
}
