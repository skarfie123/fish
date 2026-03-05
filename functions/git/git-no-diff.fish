function git-no-diff --wraps='git diff --exit-code --stat' --description 'alias git-no-diff=git diff --exit-code --stat'
  git diff --exit-code --stat $argv
        
end
