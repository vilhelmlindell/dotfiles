if status is-interactive
    #if not set -q TMUX
    #    alias tmux="TERM=screen-256color-bce tmux"
    #    exec tmux
    #end
    if set -q ZELLIJ
    else
        zellij
    end
    starship init fish | source
    zoxide init fish | source

    set -g $EDITOR vim
end
