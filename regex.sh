rx_match() {
    needle="$1"; haystack="$2"

    eval \
        "case \"\$haystack\" in
            $needle)
                return 0
            ;;
            *)
                return 1
            ;;
        esac";
}

