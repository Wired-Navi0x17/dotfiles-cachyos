source /usr/share/cachyos-fish-config/cachyos-config.fish

set -gx PYTHONSTARTUP $HOME/workspace/Config/TerminalProfile/Python/profile.py

if test "$TERM_PROGRAM" = "vscode"
    function fish_greeting
    end
end

# Added by Antigravity CLI installer
set -gx PATH "$HOME/.local/bin" $PATH

function fastfetch
    set img (~/.config/fastfetch/random_lain.sh)

    kitten @ set-font-size 9

    command fastfetch \
        --logo-type kitty-icat \
        --logo $img \
        $argv

    kitten @ set-font-size 14
end
# kimi-code
fish_add_path -g "$HOME/.kimi-code/bin"

