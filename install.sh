#!/usr/bin/env bash
set -e

# Bash / Zsh
POSIX_FILE="$HOME/.shell-mcd.sh"

cat > "$POSIX_FILE" <<'EOF'
mcd() {
    if [ $# -eq 0 ]; then
        echo "Usage: mcd <directory>"
        return 1
    fi

    mkdir -p -- "$1" && cd -- "$1"
}
EOF

# Fish
FISH_DIR="$HOME/.config/fish/functions"
FISH_FILE="$FISH_DIR/mcd.fish"

mkdir -p "$FISH_DIR"

cat > "$FISH_FILE" <<'EOF'
function mcd
    if test (count $argv) -eq 0
        echo "Usage: mcd <directory>"
        return 1
    end

    mkdir -p -- $argv[1]; and cd $argv[1]
end
EOF

install_source() {
    local rc="$1"

    [ -f "$rc" ] || touch "$rc"

    if ! grep -Fq '.shell-mcd.sh' "$rc"; then
        {
            echo
            echo "# MCD"
            echo '[ -f "$HOME/.shell-mcd.sh" ] && source "$HOME/.shell-mcd.sh"'
        } >> "$rc"
    fi
}

install_source "$HOME/.bashrc"
install_source "$HOME/.zshrc"

echo "Installed mcd for Bash, Zsh, and Fish."
echo ""
echo "To activate it, restart your shell:"
echo ""
echo "  Bash:  exec bash"
echo "  Zsh:   exec zsh"
echo "  Fish:  exec fish"
echo ""
echo "Or simply reload your config:"
echo ""
echo "  Bash:  source ~/.bashrc"
echo "  Zsh:   source ~/.zshrc"
echo ""
echo "Fish does not need sourcing; restart is enough."