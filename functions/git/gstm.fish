function gstm --wraps='git stash -m' --description 'alias gstm=git stash -m'
  git stash -m $argv
        
end
