function dark --wraps=osascript\ -e\ \'tell\ app\ \"System\ Events\"\ to\ tell\ appearance\ preferences\ to\ set\ dark\ mode\ to\ not\ dark\ mode\' --description alias\ dark\ osascript\ -e\ \'tell\ app\ \"System\ Events\"\ to\ tell\ appearance\ preferences\ to\ set\ dark\ mode\ to\ not\ dark\ mode\'
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode' $argv
        
end
