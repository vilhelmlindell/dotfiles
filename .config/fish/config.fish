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

set fish_greeting

alias sbcl='rlwrap sbcl'

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



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/vilhelm/.opam/opam-init/init.fish' && source '/home/vilhelm/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
