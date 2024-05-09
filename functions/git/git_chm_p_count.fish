function git_chm_p_count --wraps='gchm; gp; git shortlog -s --author "Rahul Pai"' --description 'alias git_chm_p_count=gchm; gp; git shortlog -s --author "Rahul Pai"'
  gchm; gp; git shortlog -s --author "Rahul Pai" $argv
        
end
