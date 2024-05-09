function gca --wraps='git commit -a -m' --description 'alias gca=git commit -a -m'
  git commit -a -m $argv
        
end
