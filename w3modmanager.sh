#!/usr/bin/env bash
# W3 Linux Mod Manager launcher. Put it next to w3modmanager.py and run it:
#
#   ./w3modmanager.sh                    start the app
#   ./w3modmanager.sh --install-desktop  add W3 Linux Mod Manager to your app menu
#   ./w3modmanager.sh --remove-desktop   take it out again
#   ./w3modmanager.sh --reset            delete the app's private Python setup (made again next start)
#
# The app needs Python 3 and PyQt6. If your system has both (Fedora: sudo dnf install python3-pyqt6),
# the app simply runs with them. If PyQt6 is missing (Steam Deck, or you'd rather not install system
# packages), the first start makes a private Python environment for the app, the folder
# w3modmanager_venv right here next to the app, and installs PyQt6 into it: with uv if you have it,
# else with Python's own venv and pip. That takes a minute once; later starts are instant. It stays
# with the app: move or delete the app's folder and it goes along. --reset removes it.
# The only file put anywhere else is the app menu entry, and only when you ask for it.
#
# Once the app lives in _ModManager, it starts from a ready-to-run copy of itself kept there,
# w3modmanager.compiled, so Python doesn't translate the whole w3modmanager.py again on every
# start. The copy carries the exact fingerprint of the w3modmanager.py and the Python it was made
# for: a new version of the app, another Python, or a damaged copy, and it's simply made again.
#
# On its first start the app moves itself (with this launcher, its settings and the Python setup)
# into the game folder's _ModManager folder, and leaves "shortcut_w3lmm.sh" here: a shortcut with
# the app's new place in its APP_HOME line. Start that one from then on. To update, put the new
# w3modmanager.py (and this file, if you like) next to it and start either: they find the app
# through the shortcut, and the new version moves in.
set -euo pipefail
export W3MM_T0="${W3MM_T0:-${EPOCHREALTIME:-}}"   # when you started it: the app notes how long it took to come up

# Where the app lives now, written in by the app when it moved there (empty: right here)
APP_HOME=''
HERE="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
APP="$HERE/w3modmanager.py"
VENV="$HERE/w3modmanager_venv"
DESKTOP="${XDG_DATA_HOME:-$HOME/.local/share}/applications/w3modmanager.desktop"
PYQT="PyQt6>=6.5"

say() {
    # in a terminal: printed; started from the app menu: a desktop notification as well
    echo "$*"
    if [ ! -t 1 ] && command -v notify-send >/dev/null 2>&1; then
        notify-send -a "W3 Linux Mod Manager" "W3 Linux Mod Manager" "$*" || true
    fi
}

fail() {
    say "$*"
    exit 1
}

has_qt() {   # can this Python start the app?
    "$1" -c "import PyQt6.QtWidgets" >/dev/null 2>&1
}

# a fresh launcher next to a shortcut (a new release extracted beside it): the shortcut says where
# the app lives. Only the APP_HOME line is read, and only from one of our own launchers.
if [ -z "$APP_HOME" ]; then
    for f in "$HERE"/*.sh; do
        [ -f "$f" ] && [ "$f" != "$HERE/$(basename "${BASH_SOURCE[0]}")" ] || continue
        grep -Eq "W3 (Linux )?Mod Manager launcher" "$f" 2>/dev/null || continue
        found="$(sed -n "s/^APP_HOME='\(.*\)'\$/\1/p" "$f" | head -n 1 | sed "s/'\\\\''/'/g")"
        if [ -n "$found" ] && [ -d "$found" ]; then APP_HOME="$found"; break; fi
    done
fi

# a shortcut: the app moved into the game folder. A w3modmanager.py put next to this file (a new
# version, say) is started instead, and moves in in its turn.
if [ ! -f "$APP" ] && [ -n "$APP_HOME" ] && [ "$APP_HOME" != "$HERE" ]; then
    if [ -f "$APP_HOME/w3modmanager.sh" ]; then
        exec bash "$APP_HOME/w3modmanager.sh" "$@"
    fi
    fail "W3 Linux Mod Manager isn't in $APP_HOME any more (the game moved or was uninstalled?). Put w3modmanager.py next to this file and start it again to set it up."
fi

# a new version put next to this shortcut (an update): it's told where the app lives, so it finds
# your settings and moves in there, replacing the old one; and it uses the Python setup there
if [ -f "$APP" ] && [ -n "$APP_HOME" ] && [ "$APP_HOME" != "$HERE" ] && [ -d "$APP_HOME" ]; then
    export W3MM_HOME="$APP_HOME"
    [ -d "$APP_HOME/w3modmanager_venv" ] && VENV="$APP_HOME/w3modmanager_venv"
fi

case "${1:-}" in
    --install-desktop)
        mkdir -p "$(dirname "$DESKTOP")"
        cat > "$DESKTOP" <<EOF
[Desktop Entry]
Type=Application
Name=W3 Linux Mod Manager
Comment=Mod manager for The Witcher 3
Exec="$HERE/w3modmanager.sh"
Icon=applications-games
Terminal=false
Categories=Game;Utility;
EOF
        command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$(dirname "$DESKTOP")" || true
        echo "Added to your app menu: W3 Linux Mod Manager"
        exit 0 ;;
    --remove-desktop)
        rm -f "$DESKTOP"
        echo "Removed from your app menu."
        exit 0 ;;
    --reset)
        rm -rf "$VENV"
        echo "The app's private Python setup was deleted. It's made again on the next start, if needed."
        exit 0 ;;
esac

[ -f "$APP" ] || fail "w3modmanager.py isn't next to this script ($HERE)."
command -v python3 >/dev/null 2>&1 || fail "Python 3 isn't installed. Install it with your system's package manager, then start again."

# Starts the app the way "python3 w3modmanager.py" would, from the ready-to-run copy when it's
# the one for this exact file (see the top). When this Python has no working PyQt6, it hands
# straight back to this script (W3MM_NOQT says which Python failed), and PyQt6 is set up below.
STARTER='
import sys, os, types, marshal
from hashlib import sha1
from importlib.util import MAGIC_NUMBER
try:
    import PyQt6.QtWidgets
except Exception:
    os.environ["W3MM_NOQT"] = os.environ.get("W3MM_TRY", "")
    os.execvp("bash", ["bash", os.environ["W3MM_LAUNCHER"]] + sys.argv[2:])
for name in ("W3MM_TRY", "W3MM_LAUNCHER"):
    os.environ.pop(name, None)
app = sys.argv[1]
sys.argv = [app] + sys.argv[2:]
here = os.path.dirname(os.path.abspath(app))
sys.path[0] = here
with open(app, "rb") as f:
    src = f.read()
keep = os.path.basename(here).lower() == "_modmanager"
copy = os.path.join(here, "w3modmanager.compiled")
head = b"W3MMC1" + MAGIC_NUMBER + sha1(src).digest() + sha1(app.encode()).digest()
code = None
if keep:
    try:
        with open(copy, "rb") as f:
            blob = f.read()
        n = len(head)
        if blob[:n] == head and sha1(blob[n + 20:]).digest() == blob[n:n + 20]:
            code = marshal.loads(blob[n + 20:])
    except Exception:
        code = None
if code is None:
    code = compile(src, app, "exec", dont_inherit=True)
    if keep:
        tmp = copy + ".tmp"
        try:
            data = marshal.dumps(code)
            with open(tmp, "wb") as f:
                f.write(head + sha1(data).digest() + data)
            os.replace(tmp, copy)
        except Exception:
            try:
                os.unlink(tmp)
            except OSError:
                pass
main = types.ModuleType("__main__")
main.__file__ = app
starter = sys.modules["__main__"]
sys.modules["__main__"] = main
for name in ("src", "blob", "data"):
    globals().pop(name, None)
exec(code, main.__dict__)
'

# the app takes this script's place (one process, as if started directly); a Python that has no
# PyQt6 comes back here through the starter, one that can't run at all comes back from exec
shopt -s execfail
NOQT="${W3MM_NOQT:-}"
unset W3MM_NOQT
export W3MM_LAUNCHER
W3MM_LAUNCHER="$(readlink -f "${BASH_SOURCE[0]}")"
start() {
    local which="$1" py="$2"
    shift 2
    W3MM_TRY="$which" exec "$py" -c "$STARTER" "$APP" "$@" || return 0
}

# 1. the system's Python already has PyQt6: nothing to set up
if [ ! -x "$VENV/bin/python" ] && [ "$NOQT" != system ]; then
    start system python3 "$@"
fi

# 2. the app's own environment, made once (or again, if it stopped working)
if [ -x "$VENV/bin/python" ] && [ "$NOQT" != venv ] && [ "$NOQT" != final ]; then
    start venv "$VENV/bin/python" "$@"
fi
needs_setup() { [ ! -x "$VENV/bin/python" ] || ! has_qt "$VENV/bin/python"; }
if needs_setup && command -v flock >/dev/null 2>&1; then
    # one setup at a time: started again while it runs (double-clicked twice), this waits for the
    # first one to finish and then uses what it made
    exec 9<"${BASH_SOURCE[0]}"
    if ! flock -n 9; then
        say "W3 Linux Mod Manager is still being set up. It starts as soon as that's done."
        flock 9
    fi
fi
if needs_setup; then
    say "First start: setting up PyQt6 for W3 Linux Mod Manager. This takes a minute, once."
    rm -rf "$VENV"
    if command -v uv >/dev/null 2>&1; then
        UV_NO_CACHE=1 uv venv --quiet "$VENV" \
            && UV_NO_CACHE=1 uv pip install --quiet --python "$VENV/bin/python" "$PYQT" \
            || { rm -rf "$VENV"; fail "Setting up PyQt6 with uv failed. Check your internet connection and try again."; }
    else
        python3 -m venv "$VENV" 2>/dev/null \
            || { rm -rf "$VENV"; fail "Python can't make a virtual environment here. On Debian or Ubuntu, install python3-venv first (sudo apt install python3-venv), or install uv."; }
        "$VENV/bin/python" -m pip install --quiet --disable-pip-version-check --no-cache-dir "$PYQT" \
            || { rm -rf "$VENV"; fail "Installing PyQt6 failed. Check your internet connection and try again."; }
    fi
    has_qt "$VENV/bin/python" || { rm -rf "$VENV"; fail "PyQt6 was installed but doesn't start. Run this script from a terminal to see why."; }
    say "PyQt6 is set up. Starting W3 Linux Mod Manager."
fi

[ "$NOQT" != final ] && start final "$VENV/bin/python" "$@"
fail "PyQt6 doesn't start in $VENV. Run ./w3modmanager.sh --reset, then start again."
