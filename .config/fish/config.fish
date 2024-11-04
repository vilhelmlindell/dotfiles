function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert

    bind --mode insert --sets-mode default kj repaint
end

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

if status is-interactive
    fish_user_key_bindings

    starship init fish | source

    # if type -q tmux
    #     if not test -n "$TMUX"
    #         tmux -f ~/.config/tmux/tmux.conf attach-session -t default; or tmux -f ~/.config/tmux/tmux.conf new-session -s default
    #     end
    # end

    eval (zellij setup --generate-auto-start fish | string collect)
end
