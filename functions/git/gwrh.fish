alias gwrh="git worktree remove (git rev-parse --show-toplevel)/../(basename (git rev-parse --show-toplevel))-worktrees/(git symbolic-ref --short HEAD)"
function gwrh --wraps='git worktree remove (git rev-parse --show-toplevel)/../(basename (git rev-parse --show-toplevel))-worktrees/(git symbolic-ref --short HEAD)'
    set MAIN_WORKTREE (dirname (git rev-parse --git-common-dir))
    git-no-diff && git worktree remove (git symbolic-ref --short HEAD) && cd $MAIN_WORKTREE
end
