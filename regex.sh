if [ -z "$REGEX_SH" ]; then
REGEX_SH=1

rmatch() {
    eval \
        "case \"\$2\" in
            $1)
                return 0
            ;;
            *)
                return 1
            ;;
        esac";
}

fi

