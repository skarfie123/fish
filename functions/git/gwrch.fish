function gwrch
    git-no-diff && git worktree remove $argv[1] && gch $argv[1]
end
