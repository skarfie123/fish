function gwah --wraps='gwa (git symbolic-ref --short HEAD)' --description 'alias gwah=gwa (git symbolic-ref --short HEAD)'
  gwa (git symbolic-ref --short HEAD) $argv
        
end
