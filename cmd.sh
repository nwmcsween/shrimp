if [ -z "$CMD_SH" ]; then
CMD_SH=1

cmdexists() {
    type "$1" >/dev/null 2>&1;
}

fi

