if status is-interactive
    if not set -q TMUX
        alias tmux="TERM=screen-256color-bce tmux"
        exec tmux
    end
    starship init fish | source
end
