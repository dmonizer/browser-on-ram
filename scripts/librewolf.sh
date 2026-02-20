echo procname = librewolf

# Based on scripts/firefox.sh
grep '[Pp]ath=' "$HOME/.librewolf/profiles.ini" 2>/dev/null | sed 's/[Pp]ath=//' | while read -r profileItem; do
    case "$profileItem" in
        /*)
            echo "profile = $profileItem"
            echo "cache = $XDG_CACHE_HOME/librewolf/$(basename "$profileItem")"
            ;;
        *)
            echo "profile = $HOME/.librewolf/$profileItem"
            echo "cache = $XDG_CACHE_HOME/librewolf/$profileItem"
            ;;
    esac
done
