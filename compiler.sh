cc() {
    file=$1; args=$2

    $CC $args -o /dev/null "$file" > /dev/null 2>&1;
}

cc_is_pp() {
    file=$1; pp_sym=$2

    printf "typedef int x;\n#if \"$pp_sym\"\n#error\n#endif" > "$file"
    cc "$file" "-c"
}

cc_is_lflag() {
    file=$1; lflag=$2

    printf "typedef int x;\n" > "$file"
    cc "$file" "-nostdlib -shared $lflag"
}

cc_is_flag() {
    file=$1; flag=$2

    printf "typedef int x;\n" > "$file"
    cc "$file" "-c $lflag"
}

