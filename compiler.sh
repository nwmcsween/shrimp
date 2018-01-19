cc() {
  cc=$1 file=$2; args=$3

  $cc $args -o /dev/null "$file" > /dev/null 2>&1;
}

cc_is_pp() {
  cc=$1; file=$2; pp_sym=$3

  printf "typedef int x;\n#if \"%s\"\n#error\n#endif" "$pp_sym" > "$file"
  $cc "$file" "-c"
}

cc_is_lflag() {
  cc=$1; file=$2; lflag=$3

  printf "typedef int x;\n" > "$file"
  $cc "$file" "-nostdlib -shared $lflag"
}

cc_is_flag() {
  cc=$1; file=$2; flag=$3

  printf "typedef int x;\n" > "$file"
  $cc "$file" "-c $flag"
}
