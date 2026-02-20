echo procname = firefox

grep '[Pp]ath=' "$HOME/.mozilla/firefox/profiles.ini" 2>/dev/null | sed 's/[Pp]ath=//' | while read -r profileItem; do
    case "$profileItem" in
        /*)
            echo "profile = $profileItem"
            echo "cache = $XDG_CACHE_HOME/mozilla/firefox/$(basename "$profileItem")"
            ;;
        *)
            echo "profile = $HOME/.mozilla/firefox/$profileItem"
            echo "cache = $XDG_CACHE_HOME/mozilla/firefox/$profileItem"
            ;;
    esac
done
