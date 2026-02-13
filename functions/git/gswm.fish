function gswm --wraps='git switch (git config init.defaultBranch)' --description 'alias gswm=git switch (git config init.defaultBranch)'
  git switch (git config init.defaultBranch) $argv
        
end
