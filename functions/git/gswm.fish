function gchm --wraps='git switch (git config init.defaultBranch)' --description 'alias gchm=git switch (git config init.defaultBranch)'
  git switch (git config init.defaultBranch) $argv
        
end
