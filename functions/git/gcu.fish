function gcu --wraps='git reset --soft HEAD~1' --description 'alias gcu=git reset --soft HEAD~1'
  git reset --soft HEAD~1 $argv
        
end
