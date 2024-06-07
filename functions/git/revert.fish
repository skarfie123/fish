function revert --wraps='git checkout main --' --description 'alias revert git checkout main --'
  git checkout main -- $argv
        
end
