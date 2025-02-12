function awscli --wraps='aws --cli-auto-prompt' --description 'alias awscli aws --cli-auto-prompt'
  aws --cli-auto-prompt $argv
        
end
