if [ -z "$FILE_SH" ]; then
FILE_SH=1

ftmp() {
    src=$1; dir=$2
    set -C
    i=0;

    while [ "$i" -lt 50 ]; do
        eval "$src=\"\${dir}/\$\$-\$PPID-\$i\" 2>| /dev/null > \"\${dir}/\$\$-\$PPID-\$i\"" && return 1;
        ((i=i+1))
    done

    set +C
    return 0;

}

fi

