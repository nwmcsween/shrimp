if [ -z "$IO_SH" ]; then
IO_SH=1

io_puts() {
  args="$*"

  printf "%s\n" "$args";
}

fi
