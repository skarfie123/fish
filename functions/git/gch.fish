function gch --wraps='git checkout' --description 'alias gch=git checkout'
  echo "use gsw"
  git checkout $argv
        
end
