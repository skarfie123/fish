function trigger --wraps='git commit --allow-empty -m "Trigger CI"' --description 'alias trigger=git commit --allow-empty -m "Trigger CI"'
  git commit --allow-empty -m "Trigger CI" $argv
        
end
