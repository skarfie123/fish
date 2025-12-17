function gh

  if test (count $argv) -eq 0
    cd $GITHUB
  else
    env gh $argv
  end

end
