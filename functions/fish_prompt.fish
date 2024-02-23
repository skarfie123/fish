function fish_prompt
    set_color brwhite
    echo -n " "(date "+%F %H:%M:%S")" "
    echo -n \ue0c7
    set_color -b brwhite
    set_color black
    echo -n " "(prompt_pwd)" "
    set_color brwhite
    set latest_colour brwhite
    if test -n "$AWS_PROFILE"
        set_color -b yellow
        echo -n \ue0b0
        set_color black
        echo -n " $AWS_PROFILE "
        set_color yellow
        set latest_colour yellow
    end
    if test -n "$PYENV_VIRTUAL_ENV"
        set_color -b F70
        echo -n \ue0b0
        set_color black
        echo -n " "(basename $PYENV_VIRTUAL_ENV)" "
        set_color F70
        set latest_colour F70
    end
    set GIT_BRANCH (git branch --show-current 2> /dev/null)
    if test -n "$GIT_BRANCH"
        set_color -b green
        echo -n \ue0b0
        set_color black
        echo -n " $GIT_BRANCH "
        # (git status --porcelain | wc -l | tr -d ' ')
        set_color green
        set latest_colour green
    end
    set_color normal
    set_color $latest_colour
    echo -n \ue0b4
    set_color blue
    echo -n \n\u276f" "
    set_color normal
end
