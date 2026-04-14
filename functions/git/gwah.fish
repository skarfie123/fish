function gwah
  set CURRENT_BRANCH (git symbolic-ref --short HEAD)
  git-no-diff && gswm && gwa $CURRENT_BRANCH $argv
end
