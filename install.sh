#!/usr/bin/env bash
set -e

UTILS_FILE="$HOME/.shell-sh.sh"

cat > "$UTILS_FILE" <<'EOF'
mcd() {
    if [ $# -eq 0 ]; then
        echo "Usage: mcd <directory>"
        return 1
    fi

    mkdir -p -- "$1" && cd -- "$1"
}
EOF

SOURCE_LINE='[ -f "$HOME/.shell-sh.sh" ] && source "$HOME/.shell-sh.sh"'

if ! grep -Fq '.shell-sh.sh' "$HOME/.bashrc"; then
    {
        echo
        echo "# MCD"
        echo "$SOURCE_LINE"
    } >> "$HOME/.bashrc"
fi

echo "Installed mcd. Restart your shell or run:"
echo "source ~/.bashrc"