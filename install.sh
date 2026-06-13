#!/usr/bin/env bash
set -e

UTILS_FILE="$HOME/.shell-mcd.sh"

cat > "$UTILS_FILE" <<'EOF'
mcd() {
    if [ $# -eq 0 ]; then
        echo "Usage: mcd <directory>"
        return 1
    fi

    mkdir -p -- "$1" && cd -- "$1"
}
EOF

SOURCE_LINE='[ -f "$HOME/.shell-mcd.sh" ] && source "$HOME/.shell-mcd.sh"'

if ! grep -Fq '.shell-mcd.sh' "$HOME/.bashrc"; then
    {
        echo
        echo "# MCD"
        echo "$SOURCE_LINE"
    } >> "$HOME/.bashrc"
fi

echo "Installed mcd. Restart your shell or run:"
echo "source ~/.bashrc"