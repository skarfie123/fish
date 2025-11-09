function pkflameshot --wraps='pkill -9 -f flameshot && open /Applications/flameshot.app' --description 'alias pkflameshot pkill -9 -f flameshot && open /Applications/flameshot.app'
  pkill -9 -f flameshot && open /Applications/flameshot.app $argv
        
end
