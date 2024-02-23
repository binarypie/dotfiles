if status is-interactive
    # Variables
    set -x HELIX_RUNTIME /lib64/helix/runtime
    set -x QT_QPA_PLATFORM wayland

    # No Greeting
    set -g fish_greeting

    # VIM Mode
    fish_vi_key_bindings

    # Editor
    set -gx EDITOR helix

    # Prompt
    set --global hydro_multiline true
    set --global fish_prompt_pwd_dir_length 100
    set --global hydro_color_pwd $fish_color_comment
    set --global hydro_color_git $fish_color_operator
    set --global hydro_color_error $fish_color_error
    set --global hydro_color_prompt $fish_color_command
    set --global hydro_color_duration $fish_color_param

    # Exa
    set -Ux EXA_STANDARD_OPTIONS --group --header --group-directories-first --icons

    # Path
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.npm-packages/bin
    fish_add_path $HOME/.cargo/bin
end
