function fish_prompt
    # Starship handles the prompt if installed, otherwise fallback to clean arrow prompt
    if type -q starship
        # Handled by starship init
        return
    end

    set -l last_status $status
    set_color blue
    echo -n (prompt_pwd)
    set_color normal

    if test $last_status -eq 0
        set_color green
    else
        set_color red
    end

    echo -n " ❯ "
    set_color normal
end
