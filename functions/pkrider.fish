function pkrider --wraps='pkill -9 -f rider && rider' --description 'alias pkrider pkill -9 -f rider && rider'
  pkill -9 -f rider && rider $argv
        
end
