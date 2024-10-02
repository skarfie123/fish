function grd --wraps='git restore .' --description 'alias grd git restore . --staged'
  git restore . --staged $argv
        
end
