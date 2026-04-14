function gwrhsw
    set CURRENT_BRANCH (git symbolic-ref --short HEAD)
    gwrh && git-no-diff && echo "Main Worktree was at $(git symbolic-ref --short HEAD)" && gsw $CURRENT_BRANCH
end
