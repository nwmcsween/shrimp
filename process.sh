if [ -z "$PROCESS_SH" ]; then
PROCESS_SH=1

pabort() {
    printf "%s\n" "$*"
    exit 1
}

fi

