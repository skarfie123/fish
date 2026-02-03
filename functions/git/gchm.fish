function gchm --wraps='git checkout $(git config init.defaultBranch)' --description 'alias gchm=git checkout $(git config init.defaultBranch)'
  echo "use gswm"
  git checkout $(git config init.defaultBranch) $argv
        
end
