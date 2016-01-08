if [ -z "$COMPILER_SH" ]; then
COMPILER_SH=1

cc() {
    $CC $2 -o /dev/null "$1" >/dev/null 2>&1;
}

ccispp() {
    printf "typedef int x;\n#if \"$2\"\n#error\n#endif" > "$1"
    if cc "$1" -c; then
        return 1;
    else
        return 0;
    fi
}

ccislflag() {
    printf "typedef int x;\n" > "$1"
    cc "$1" "-nostdlib -shared $2"
}

ccisflag() {
    printf "typedef int x;\n" > "$1"
    cc "$1" "-c $2"
}

fi

