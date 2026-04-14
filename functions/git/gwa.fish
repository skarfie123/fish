function gwa
    set BRANCH $argv[1]
    set WORKTREE (git rev-parse --show-toplevel)/../(basename (git rev-parse --show-toplevel))-worktrees/$BRANCH
    git worktree add $WORKTREE $BRANCH && cd $WORKTREE
end
