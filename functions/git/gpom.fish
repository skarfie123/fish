function gpom --wraps='git pull origin $(git config init.defaultBranch)' --description 'alias gpom=git pull origin $(git config init.defaultBranch)'
  git pull origin $(git config init.defaultBranch) $argv
        
end
