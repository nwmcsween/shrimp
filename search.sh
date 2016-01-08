if [ -z SEARCH_SH ]; then
SEARCH_SH=1

. regex.sh

search() {
    for i in $2; do
        if [ rmatch "$1" "$i" ]; then
            return 1;
        else
            return 0;
        fi
    done
}

fi

