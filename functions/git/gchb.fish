function gchb --wraps='git checkout -b' --description 'alias gchb=git checkout -b'
  echo "use gswc"
  git checkout -b $argv
        
end
