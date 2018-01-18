cmd_exists() {
  cmd=$1

  type "$cmd" >/dev/null 2>&1;
}
