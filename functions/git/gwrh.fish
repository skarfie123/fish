function gwrh --wraps='git worktree remove (git rev-parse --show-toplevel)/../(basename (git rev-parse --show-toplevel))-worktrees/(git symbolic-ref --short HEAD)'
    set CURRENT_BRANCH (git symbolic-ref --short HEAD)
    set MAIN_WORKTREE (dirname (git rev-parse --git-common-dir))
    git-no-diff && gwr $CURRENT_BRANCH && cd $MAIN_WORKTREE
end
