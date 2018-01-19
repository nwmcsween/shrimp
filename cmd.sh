if [ -z "$CMD_SH" ]; then
CMD_SH=1

cmd_exists() {
  cmd=$1

  type "$cmd" >/dev/null 2>&1;
}

fi
