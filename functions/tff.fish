function tff --wraps='terraform fmt --recursive' --description 'alias tff terraform fmt --recursive'
  terraform fmt --recursive $argv
        
end
