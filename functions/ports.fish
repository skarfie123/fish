function ports --wraps='lsof -i -P | grep LISTEN' --description 'alias ports lsof -i -P | grep LISTEN'
  lsof -i -P | grep LISTEN $argv
        
end
