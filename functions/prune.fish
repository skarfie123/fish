function prune
  docker system prune --volumes $argv
  docker volume prune --all $argv
end
